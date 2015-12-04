;; haskell-mode

(add-to-list 'exec-path "{{path_to_ghc_mod_bin_dir}}")
(add-to-list 'load-path "{{path_to_stack-ghci-mode}}")
(autoload 'stack-ghci-mode "stack-ghci-mode" "Major mode for editing haskell." t)
(add-to-list 'auto-mode-alist '("\\.hs\\'" . stack-ghci-mode))

(add-hook 'stack-ghci-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'stack-ghci-mode-hook 'turn-on-haskell-indent)
(add-hook 'stack-ghci-mode-hook 'font-lock-mode)
(add-hook 'stack-ghci-mode-hook 'imenu-add-menubar-index)
(add-hook 'stack-ghci-mode-hook (lambda () (flymake-mode)))

(defun my-smartchr-keybindings-haskell ()
  (local-set-key (kbd "-")  (smartchr '("-" " - " " -- ")))
  (local-set-key (kbd "+")  (smartchr '("+" " + " " ++ ")))
  (local-set-key (kbd "=")  (smartchr '("=" " = " " == " " /= " )))
  (local-set-key (kbd ">")  (smartchr '(">" " > " " >> " " -> " " => " " >>= ")))
  (local-set-key (kbd "<")  (smartchr '("<" " < " " <- " " <= " " =<< ")))
  (local-set-key (kbd ".")  (smartchr '("." ".." " . " )))
  (local-set-key (kbd ";")  (smartchr '(";" " :: " " : ")))
  (local-set-key (kbd "!")  (smartchr '("!" " !! " " ! ")))
  (local-set-key (kbd "*")  (smartchr '("*" " * " " <*> ")))
  (local-set-key (kbd "$")  (smartchr '("$" " $ " " <$> ")))
  (local-set-key (kbd "|")  (smartchr '("|" " | " "<|>"))))

(dolist (hook (list
               'stack-ghci-mode-hook))
  (add-hook hook 'my-smartchr-keybindings-haskell))

(add-hook 'stack-ghci-mode-hook 'ac-haskell-process-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'stack-ghci-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (add-to-list 'completion-at-point-functions 'auto-complete))

(add-hook 'stack-ghci-mode-hook 'set-auto-complete-as-completion-at-point-function)

(eval-after-load 'stack-ghci-mode
    '(define-key stack-ghci-mode-map (kbd "C-c C-d") 'ac-haskell-process-popup-doc))
