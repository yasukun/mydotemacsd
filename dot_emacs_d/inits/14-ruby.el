;;; 14-ruby.el --- ruby-mode

(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(provide '14-ruby)
;;; 14-ruby.el ends here
