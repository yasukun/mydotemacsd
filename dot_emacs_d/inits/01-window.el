;; 起動画面を表示しない
(setq inhibit-splash-screen t)

;; 余計なものを表示しない
(when window-system
  (tool-bar-mode 0) ;; ツールバー
  (toggle-scroll-bar nil)) ;; スクロールバー

(scroll-bar-mode -1)

;; ファイル名補完機能で大文字と小文字の区別をなくす
(setq completion-ignore-case t)

;; 保存時行末の空白を削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; 英語
(set-face-attribute 'default nil
             :family "Menlo" ;; font
             :height 140)    ;; font size

;; 日本語
(set-fontset-font
 nil 'japanese-jisx0208
;; (font-spec :family "Hiragino Mincho Pro")) ;; font
  (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

;; 半角と全角の比を1:2にしたければ
(setq face-font-rescale-alist
;;        '((".*Hiragino_Mincho_pro.*" . 1.2)))
      '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)));; Mac用フォント設定

;; ;; no backup file
;; (setq backup-inhibited t)

;; (setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; ;;; 対応する括弧を光らせる。
;; (show-paren-mode t)

(setq ring-bell-function 'ignore)

;; より下に記述した物が PATH の先頭に追加されます
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
	      "/usr/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))


;; PATH と exec-path に同じ物を追加します
(when (and (file-exists-p dir) (not (member dir exec-path)))
  (setenv "PATH" (concat dir ":" (getenv "PATH")))
  (setq exec-path (append (list dir) exec-path))))

;; バッファ名の識別文字列変更
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(display-time)
(setq display-time-day-and-date t)
(setq display-time-string-forms
 '((format "%s/%s(%s)%s:%s"
		 month day dayname
		 24-hours minutes
		 )))

(set-face-background 'hl-line "aquamarine")

(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interacton-mode-hook 'enable-paredit-mode)
(eval-after-load "paredit"
  #'(define-key paredit-mode-map (kbd "C-j") 'eval-print-last-sexp))

(setq default-major-mode 'lisp-interaction-mode)
