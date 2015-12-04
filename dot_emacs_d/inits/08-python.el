;; python
(add-hook 'python-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (setq py-indent-offset 4)))


;; auto insert
(auto-insert-mode 1)
(add-to-list 'auto-insert-alist '("\\.py$" . "pyheader.tmpl"))
(add-to-list 'auto-insert-alist '("\\.rst$" . "rstheader.tmpl"))
