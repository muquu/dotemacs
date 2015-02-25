(require 'helm-config)
;(require 'helm-ag)
(require 'helm-descbinds)

(helm-descbinds-mode)

(global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c b") 'helm-descbinds)
(global-set-key (kbd "C-c o") 'helm-occur)
;(global-set-key (kbd "C-c s") 'helm-ag)
(global-set-key (kbd "C-c y") 'helm-show-kill-ring)

;;
;; recentf and recentf-ext.el の設定
;;
(require 'recentf)
(setq recentf-save-file "~/.emacs.d/.recentf")
(setq recentf-max-saved-items 100)      ;; recentf に保存するファイルの数
(require 'recentf-ext)
