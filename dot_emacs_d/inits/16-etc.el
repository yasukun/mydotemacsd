(require 'open-junk-file)

(setq open-junk-file-format "{{path_to_junkfile}}")
(global-set-key (kbd "C-x j") 'open-junk-file)
