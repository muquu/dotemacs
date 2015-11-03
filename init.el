;; ~/.emacs.d/site-lisp 以下全部読み込み
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;; パッケージ
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

(require 'cl)

(defvar installing-package-list
  '(

    ;; init-loader
    init-loader

    ;; color-theme
    solarized-theme

    ;; helm
    helm
    helm-descbinds
    helm-ag
    helm-projectile

    ;; magit
    magit

    ;; git-gutter
    git-gutter
    git-gutter-fringe

    ;; Daredevel SKK
    ddskk

    ;; the_siver_searcher (agコマンドが必要)
    ag

    ;; $PATHを引き継ぐ
    exec-path-from-shell

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; ファイル管理
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; direx
    direx

    ;; ファイルビューワー
    projectile

    ;; diredの履歴も記録する
    recentf-ext

    ;; 試行錯誤用のファイルを開く
    open-junk-file

    ;; 保存時に自動バイトコンパイル
    auto-async-byte-compile

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; 編集支援
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; 式の評価結果を注釈する
    lispxmp

    ;; 括弧の対応を保持して編集する
    paredit

    ;; sequential operation
    smartrep

    ;; Multiple cursors
    multiple-cursors

    ;; auto-complete
    ;auto-complete

    ;; company-mode
    company

    ;; C/C++ development
    cmake-mode
    cpputils-cmake

    ;; スニペット
    yasnippet

    ;; flycheck
    flycheck

    ;; 括弧やクォートなどを自動挿入,管理
    smartparens

    ;; テキストを移動させる
    move-text

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Visualize,Appearance,Miscellaneous
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; undo履歴をビジュアライズ
    undo-tree

    ;; バッファやEmacs終了後もファイルのundo履歴を保持
    undohist

    ;; yankやundoをハイライトで強調表示
    volatile-highlights

    ;; 現在の行をハイライトする
    hl-line+

    ;; 検索,置換
    anzu

    ;; 選択範囲の機能を強化
    expand-region

    ;; 大量の括弧を色分け
    rainbow-delimiters

    ;; 補完などをポップアップ表示
    popwin

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; モード
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; Markdown
    markdown-mode

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
(init-loader-load "~/.emacs.d/init-loader")
