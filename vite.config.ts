import path from 'path';
import { defineConfig, loadEnv } from 'vite';
import { fileURLToPath } from 'url';
import react from '@vitejs/plugin-react';
import { copyFile } from 'fs/promises';

export default defineConfig(({ mode }) => {
    const env = loadEnv(mode, '.', '');
    const rootDir = path.dirname(fileURLToPath(import.meta.url));
    
    return {
      optimizeDeps: {
        exclude: []
      },
      server: {
        port: 3000,
        host: '0.0.0.0',
      },
      plugins: [
        react(),
        {
            name: 'copy-root-files',
            apply: 'build',
            async writeBundle(options) {
                const outDir = options.dir || path.resolve(rootDir, 'dist');
                const filesToCopy = ['sw.js', 'aprobar-descuento-template.html', 'aprobar-descuento-loader.js', 'aprobar-descuento.css'];
                
                for (const file of filesToCopy) {
                    const sourceFile = path.resolve(rootDir, file);
                    const destFile = path.resolve(outDir, file);
                    try {
                        await copyFile(sourceFile, destFile);
                        console.log(`[copy-plugin] Copied ${file} to ${outDir}`);
                    } catch (error: any) {
                        if (error.code === 'ENOENT') {
                            console.warn(`[copy-plugin] Source file not found, skipping: ${sourceFile}`);
                        } else {
                            console.error(`[copy-plugin] Failed to copy ${file}:`, error);
                        }
                    }
                }
            }
        }
      ],
      define: {
        'process.env.API_KEY': JSON.stringify(env.GEMINI_API_KEY),
        'process.env.GEMINI_API_KEY': JSON.stringify(env.GEMINI_API_KEY)
      },
      resolve: {
        alias: {
          '@': path.resolve(rootDir, '.'),
        }
      },
      build: {
        rollupOptions: {
          input: 'index.html',
        },
      },
    };
});
