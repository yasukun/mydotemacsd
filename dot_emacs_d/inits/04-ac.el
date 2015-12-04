;; auto-complete
(when (require 'auto-complete-config nil t)
  (ac-config-default)
  (setq ac-auto-start 1)
  ;;(setq ac-auto-start nil) ; 自動的に開始しない
  (ac-set-trigger-key "TAB") ; コンテキストに応じてTABで補完
  (setq ac-dwim t)
  (setq ac-use-menu-map t) ;; C-n/C-pで候補選択可能
  (add-to-list 'ac-sources 'ac-source-yasnippet) ;; 常にYASnippetを補完候補に
  (setq ac-dictionary-directories "{{path_to_ac-dict}}") ;; 辞書ファイルのディレクトリ
  (setq ac-comphist-file "{{path_to_ac_comphist_dat}}") ;; 補完履歴のキャッシュ先
  )

(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
         (if (not (minibufferp (current-buffer)))
      (auto-complete-mode 1))))
