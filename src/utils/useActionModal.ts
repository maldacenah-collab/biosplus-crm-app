// src/utils/useActionModal.ts
import { useCallback, useState } from 'react';
import { ActionModalProps, ActionModalButton } from '../components/common/ActionModal';

type ModalConfig = Omit<ActionModalProps, 'isOpen'>;

const DEFAULT_CONFIG: ModalConfig = {
  title: '',
  message: '',
  buttons: [],
};

export const useActionModal = (initialConfig?: Partial<ModalConfig>) => {
  const [config, setConfig] = useState<ModalConfig>({ ...DEFAULT_CONFIG, ...initialConfig });
  const [isOpen, setIsOpen] = useState(false);

  const hideModal = useCallback(() => {
    setIsOpen(false);
  }, []);

  const showModal = useCallback(
    (modalConfig: ModalConfig | ((hide: () => void) => ModalConfig)) => {
      const resolvedConfig = typeof modalConfig === 'function' ? modalConfig(hideModal) : modalConfig;
      setConfig(resolvedConfig);
      setIsOpen(true);
    },
    [hideModal],
  );

  const showMessage = useCallback(
    (title: string, message: ModalConfig['message'], buttons?: ActionModalButton[]) => {
      showModal((hide) => ({
        title,
        message,
        buttons:
          buttons ||
          [
            {
              label: 'Aceptar',
              onClick: hide,
              variant: 'primary',
            },
          ],
      }));
    },
    [showModal],
  );

  return {
    modalProps: { ...config, isOpen },
    showModal,
    showMessage,
    hideModal,
    setModalButtons: (buttons: ActionModalButton[]) =>
      setConfig((prev) => ({
        ...prev,
        buttons,
      })),
  };
};

export type UseActionModalReturn = ReturnType<typeof useActionModal>;
