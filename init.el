;; ~/.emacs.d/site-lisp 以下全部読み込み
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;; パッケージ
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'cl)

(defvar installing-package-list
  '(

    ;; init-loader
    init-loader

    ;; color-theme
    molokai-theme

    ;; hl-line
    hl-line+

    ;; helm
    helm helm-descbinds

    ;; magit
    magit

    ;; diredの履歴も記録する
    recentf-ext

    ;; 試行錯誤用のファイルを開く
    open-junk-file

    ;; 式の評価結果を注釈する
    lispxmp

    ;; 括弧の対応を保持して編集する
    paredit

    ;; 保存時に自動バイトコンパイル
    auto-async-byte-compile

    ;; ウィンドウ構成管理
    elscreen

    ;; 連続操作
    smartrep

    ;; migemo
    migemo

    ;; auto-complete
    auto-complete

    ;; yasnippets
    yasnippet

    ;; flycheck
    flycheck

    ;; mozc
    mozc
    mozc-popup
    ac-mozc
    
    ;; GNU GLOBAL
    ggtags
    helm-gtags
    
    ;; PHP
    php-mode
    php-completion
    phpunit
    php-eldoc
    php-auto-yasnippets
    
    ;; python
    python-environment
    jedi
    
    ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
