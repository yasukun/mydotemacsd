(require 'google-translate)
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)

;; 翻訳のデフォルト値を設定（en -> ja）
(custom-set-variables
  '(google-translate-default-source-language "en")
  '(google-translate-default-target-language "ja"))

(global-set-key (kbd "C-x T") '(lambda ()
				 (interactive)
				 (let ((google-translate-default-source-language "ja")
				       (google-translate-default-target-language "en"))
				   (google-translate-at-point))))


;; popwin.el
(require 'popwin)

(setq display-buffer-function 'popwin:display-buffer)
;; ポップアップを画面下に表示
(setq popwin:popup-window-position 'bottom)

;; google-translate.elの翻訳バッファをポップアップで表示させる
(push '("*Google Translate*") popwin:special-display-config)
