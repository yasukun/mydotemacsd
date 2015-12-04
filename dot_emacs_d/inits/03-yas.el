;; yasnippet
(add-to-list 'load-path
              "{{path_to_yasnippet}}")
(require 'yasnippet)
(yas/global-mode 1)


(defun yas/expand-link (key)
  "Hyperlink function for yasnippet expansion."
  (delete-region (point-at-bol) (1+ (point-at-eol)))
  (insert key)
  (yas/expand))

(defun yas/expand-link-choice (&rest keys)
  "Hyperlink to select yasnippet template."
  (yas/expand-link (completing-read "Select template: " keys nil t)))

(custom-set-variables
 '(yas/trigger-key  "M-o")
 '(yas/snippet-dirs '("{{path_to_snippets}}"
		      "{{path_to_plugins_yasnippet_snippets}}")))
(yas/global-mode t)

;; snippet-mode for *.yasnippet files
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))
