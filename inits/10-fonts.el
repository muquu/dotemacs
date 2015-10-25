(set-face-attribute 'default nil
		    :family "Inconsolata"
		    :height 120)
;; (set-fontset-font nil 'japanese-jisx0208
;; 		    (font-spec :family "MeiryoKe Console")

(dolist (target '(japanese-jisx0212
		  japanese-jisx0213-2
		  japanese-jisx0213.2004-1
		  katakana-jisx0201
		  ))
  (set-fontset-font (frame-parameter nil 'font)
		    target
		    (font-spec :family "MeiryoKe_Console" :registry "unicode-bmp" :lang 'ja)))
