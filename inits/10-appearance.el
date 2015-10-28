;;
;; 外観,フォントなどの設定
;;
(when (package-installed-p 'solarized-theme)
  (load-theme 'solarized-dark t))

;(when (package-installed-p 'molokai-theme)
  ;(load-theme 'molokai t))


;;
;; フォント
;;
(when (eq window-system 'w32)
  (set-face-attribute 'default nil
		      :family "Inconsolata"
		      :height 120)

  (dolist (target '(japanese-jisx0212
		    japanese-jisx0213-2
		    japanese-jisx0213.2004-1
		    katakana-jisx0201
		    ))
    (set-fontset-font (frame-parameter nil 'font)
		      target
		      (font-spec :family "MeiryoKe_Console" :registry "unicode-bmp" :lang 'ja))))

(when (eq window-system 'x)
  (set-face-attribute 'default nil
		      :family "Ricty"
		      :height 120))

;; 現在行に色をつける
(global-hl-line-mode 1)
;;(set-face-background 'hl-line "darkolivegreen")
;;(set-face-foreground 'highlight nil)

;; 対応する括弧を表示させる
(show-paren-mode 1)

;; モードラインに時刻を表示する
(display-time)
;; 行番号・桁番号を表示する
(global-linum-mode t)
;;(line-number-mode t)
;;(column-number-mode t)
;; リージョンに色をつける
(transient-mark-mode t)

;; mode-line
(set-face-background 'mode-line "gray20")
(set-face-attribute 'mode-line-buffer-id nil :background "gray20")

;;
;; rainbow-delimiters
;;
(when (require 'rainbow-delimiters nil t)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;;
;; volatile-highlights
;;
(when (require 'volatile-highlights nil t)
  (volatile-highlights-mode t))
