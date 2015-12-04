;;; 12-commonlisp.el ---
(setq inferior-lisp-program "clisp")
(add-hook 'lisp-mode-hook
          (lambda ()
            ;; (slime-mode t)
            (define-key lisp-mode-map (kbd "C-c C-s") 'slime)
            (add-to-list 'ac-sources 'ac-source-slime)))
(add-hook 'comint-mode-hook
          (lambda ()
            ;; (slime-mode t)
            (auto-complete-mode t)))

(add-hook 'lisp-interaction-mode-hook
	  (lambda ()
	    (define-key lisp-interaction-mode-map (kbd "C-j") 'eval-print-last-sexp)))
