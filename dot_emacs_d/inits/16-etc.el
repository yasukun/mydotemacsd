(require 'open-junk-file)

(setq open-junk-file-format "{{path_to_junkfile}}")
(global-set-key (kbd "C-x j") 'open-junk-file)

(show-paren-mode 1)
(setq show-paren-delay 0)

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))


(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)
