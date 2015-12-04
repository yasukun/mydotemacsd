(add-to-list 'load-path "{{path_to_twittering-mode-master}}")
(require 'twittering-mode)
;; タイムラインを300秒ごとに更新する
(setq twittering-timer-interval 300)
;; OAuth, xAuthで取得した認証済みaccess tokenを暗号化して保存する
(setq twittering-proxy-use t)
;; (setq twittering-https-proxy-server "{{http_proxy_host}}")
;; (setq twittering-https-proxy-port {{http_proxy_port}})
;; (setq twittering-proxy-server "{{https_proxy_host}}")
;; (setq twittering-proxy-port {{https_proxy_port}})

(setq twittering-use-master-password t)
;; (setq twittering-debug-mode t)

(setq twittering-timeline-spec-alias
      '(("haskell-jp" . ":search/haskell lang:ja/")
	("clojure-jp" . ":search/clojure -ALGOL lang:ja/")))

(setq twittering-initial-timeline-spec-string
      '("sukezo"
	"sukezo/jp-filter"
        "$clojure-jp"
	"$haskell-jp"
	))

;; w3m
(setq load-path (cons (expand-file-name "{{path_to_emacs-w3m}}") load-path))
(require 'w3m-load)
(setq browse-url-browser-function 'w3m-browse-url)

(require 'reddit)
