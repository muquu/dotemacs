;; Windows用の設定

;; フォント  
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

;; パス
;; (when (eq window-system 'w32)
;;   (setenv "PATH"
;; 	  (format "%s;%s;%s"
;; 		  "E:\\msys64\\usr\\bin"
;; 		  "E:\\msys64\\mingw64\\bin"
;; 		  (or (getenv "PATH") "")))
;;   (setq explicit-shell-file-name "E:\\msys64\\usr\\bin\\sh.exe"))

;; エンコーディング
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(setq buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-dos)
(set-default-coding-systems 'utf-8-dos)
(setq file-name-coding-system 'shift_jis)

