;; DDSKK の設定
;(require 'skk-autoloads)
;; AZIKを使用する
;(setq skk-use-azik t)
;(setq skk-azik-key 'en)
;; skk-auto-fill-mode だと35文字(半角70文字)で自動改行されてしまう
(global-set-key "\C-xj" 'skk-mode)

;; Enterによる確定で改行しない
(setq skk-egg-like-newline t)
