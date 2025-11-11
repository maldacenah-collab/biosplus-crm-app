// src/pages/AsistenteIAPage.tsx
import React, { useState, useRef, useEffect } from 'react';
import { PaperAirplaneIcon } from '@heroicons/react/24/solid';
// Fix: Use `GoogleGenAI` instead of the deprecated `GoogleGenerativeAI`.
import { GoogleGenAI, Chat } from '@google/genai';

interface Message {
  id: number;
  text: string;
  sender: 'user' | 'ai';
}

const AsistenteIAPage = () => {
  const [messages, setMessages] = useState<Message[]>([
    { id: 1, text: "Hola, soy Apolo. ¿En qué puedo ayudarte hoy?", sender: 'ai' }
  ]);
  const [input, setInput] = useState('');
  const [isGenerating, setIsGenerating] = useState(false);
  const messagesEndRef = useRef<null | HTMLDivElement>(null);
  const textareaRef = useRef<null | HTMLTextAreaElement>(null);
  const chatSession = useRef<Chat | null>(null);

  // Initialize the chat session on component mount
  useEffect(() => {
    try {
      // Fix: Use `GoogleGenAI` instead of the deprecated `GoogleGenerativeAI`.
      const ai = new GoogleGenAI({ apiKey: process.env.API_KEY });
      chatSession.current = ai.chats.create({
        model: 'gemini-2.5-flash',
        config: {
          systemInstruction: 'You are Apolo, an expert sales assistant for BiosPlus, a company that sells aesthetic supplies to professionals. You are helpful, concise, and an expert in sales strategies, product information, and customer management.',
        },
      });
    } catch (error) {
      console.error("Failed to initialize Gemini AI:", error);
      setMessages(prev => [...prev, {
        id: Date.now(),
        text: "Error: No se pudo inicializar el asistente de IA. Por favor, verifica la configuración de la API Key.",
        sender: 'ai'
      }]);
    }
  }, []);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages]);
  
  useEffect(() => {
    const textarea = textareaRef.current;
    if (textarea) {
      textarea.style.height = 'auto';
      textarea.style.height = `${textarea.scrollHeight}px`;
    }
  }, [input]);

  const handleSendMessage = async (e: React.FormEvent) => {
    e.preventDefault();
    const trimmedInput = input.trim();
    if (!trimmedInput || isGenerating || !chatSession.current) return;

    const newUserMessage: Message = {
      id: Date.now(),
      text: trimmedInput,
      sender: 'user',
    };
    setMessages(prev => [...prev, newUserMessage]);
    setInput('');
    setIsGenerating(true);

    // Create a placeholder for the AI's response
    const aiMessageId = Date.now() + 1;
    setMessages(prev => [...prev, { id: aiMessageId, text: '', sender: 'ai' }]);

    try {
      const stream = await chatSession.current.sendMessageStream({ message: trimmedInput });
      
      let fullText = '';
      for await (const chunk of stream) {
        fullText += chunk.text;
        setMessages(prev =>
          prev.map(msg =>
            msg.id === aiMessageId ? { ...msg, text: fullText } : msg
          )
        );
      }
    } catch (error) {
      console.error("Error communicating with Gemini API:", error);
      setMessages(prev =>
        prev.map(msg =>
          msg.id === aiMessageId ? { ...msg, text: "Lo siento, ocurrió un error al procesar tu solicitud." } : msg
        )
      );
    } finally {
      setIsGenerating(false);
    }
  };

  return (
    <div className="flex flex-col h-full bg-white rounded-2xl shadow-lg">
      <div className="p-4 border-b">
        <h1 className="text-xl font-bold text-text-main text-center">Asistente de Ventas IA ✨ Apolo</h1>
      </div>

      <div className="flex-1 overflow-y-auto p-6 space-y-6">
        {messages.map(msg => (
          <div key={msg.id} className={`flex items-end gap-2 ${msg.sender === 'user' ? 'justify-end' : 'justify-start'}`}>
            <div className={`max-w-xl px-4 py-3 rounded-2xl ${msg.sender === 'user' ? 'bg-primary text-white rounded-br-none' : 'bg-slate-100 text-text-main rounded-bl-none'}`}>
              {msg.sender === 'ai' && msg.text === '' && isGenerating ? (
                <div className="flex items-center justify-center space-x-1">
                  <div className="w-2 h-2 bg-slate-400 rounded-full animate-bounce [animation-delay:-0.3s]"></div>
                  <div className="w-2 h-2 bg-slate-400 rounded-full animate-bounce [animation-delay:-0.15s]"></div>
                  <div className="w-2 h-2 bg-slate-400 rounded-full animate-bounce"></div>
                </div>
              ) : (
                <p className="text-sm whitespace-pre-wrap break-words">{msg.text}</p>
              )}
            </div>
          </div>
        ))}
        <div ref={messagesEndRef} />
      </div>

      <div className="p-4 border-t bg-slate-50 rounded-b-2xl">
        <form onSubmit={handleSendMessage} className="flex items-end space-x-3">
          <textarea
            ref={textareaRef}
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyDown={(e) => {
              if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault();
                handleSendMessage(e);
              }
            }}
            placeholder="Escribe tu comando aquí... (ej: Prepara una promoción de Revanesse para clientes inactivos)"
            className="form-input flex-1 resize-none max-h-40"
            rows={1}
            disabled={isGenerating}
          />
          <button type="submit" className="btn btn-primary p-3 rounded-full disabled:bg-gray-400 disabled:cursor-not-allowed shrink-0" disabled={isGenerating || !input.trim()}>
            <PaperAirplaneIcon className="w-5 h-5" />
          </button>
        </form>
      </div>
    </div>
  );
};

export default AsistenteIAPage;