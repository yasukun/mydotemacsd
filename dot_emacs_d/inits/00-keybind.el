(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; バックアップファイルを作らない
(setq make-backup-files nil)
(setq auto-save-default nil)
;; (setp auto-save-list-file-prefix nil)
(setq create-lockfiles nil)

;; Ctrl-h => backspace
(global-set-key "\C-h" 'delete-backward-char)

;; Ctrl-t でバッファ移動
;; move other window
(defun split-window-vertically-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-vertically)
    (progn
      (split-window-vertically
       (- (window-height) (/ (window-height) num_wins)))
      (split-window-vertically-n (- num_wins 1)))))
(defun split-window-horizontally-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-horizontally)
    (progn
      (split-window-horizontally
       (- (window-width) (/ (window-width) num_wins)))
      (split-window-horizontally-n (- num_wins 1)))))

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (if (>= (window-body-width) 270)
        (split-window-horizontally-n 3)
      (split-window-horizontally)))
  (other-window 1))

(global-unset-key "\C-t")
(global-unset-key "\C-z")
(global-set-key (kbd "C-t") 'other-window-or-split)
;; デフォルトのC-t -> C-zに変更
(global-set-key (kbd "C-z") 'transpose-chars)

;; osx emacs用 Command キーと Option キーの動作を逆
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; 矩形選択 C-space C-enter
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; 空白以外の行頭へ移動が出来るように
(defun my-move-beginning-of-line ()
  (interactive)
  (if (bolp)
      (back-to-indentation)
      (beginning-of-line)))
(global-set-key "\C-a" 'my-move-beginning-of-line)

(global-set-key "\M-[" 'beginning-of-buffer)
(global-set-key "\M-]" 'end-of-buffer)

;; multiple-cursors.el
(require 'multiple-cursors)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this) ; does not work
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

;; C-x C-f default directory
(setq default-directory "~/")

;; smartchr
(add-to-list 'load-path "{{path_to_smartchr}}")
(require 'smartchr)
