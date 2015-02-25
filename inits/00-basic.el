;;reload
(global-set-key [f12] 'eval-buffer)
;; バックアップファイルを作らない(*.~)
(setq make-backup-files nil)
;; オートセーブファイルを作らない(#*.*)
(setq auto-save-default nil)
;; ツールバー非表示
(tool-bar-mode 0)
;; スクロールバー非表示
(scroll-bar-mode 0)
;; デフォルトエンコーディング
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
;; ロケール
(setenv "LANG" "ja_JP.UTF-8")

;;; 現在行に色をつける
(global-hl-line-mode 1)
;;(set-face-background 'hl-line "darkolivegreen")
;;(set-face-foreground 'highlight nil)
;; カラーテーマ
;; molokai-theme
(load-theme 'molokai t)

;;; 履歴を次回Emacs起動時にも保存する
(savehist-mode 1)
;;; ファイル内のカーソル位置を記憶する
(setq-default save-place t)
(require 'saveplace)
;;; 対応する括弧を表示させる
(show-paren-mode 1)
;;; シェルに合わせるため、C-hは後退に割り当てる
;;; ヘルプは <f1> も使えるので本書では <f1> と書いている
(global-set-key (kbd "C-h") 'delete-backward-char)
;;; モードラインに時刻を表示する
(display-time)
;;; 行番号・桁番号を表示する
(global-linum-mode t)
;(line-number-mode t)
;(column-number-mode t)
;;; リージョンに色をつける
(transient-mark-mode t)
;;; GCを減らして軽くする(デフォルトの10倍)
;;; 現在のマシンパワーではもっと大きくしてもよい
(setq gc-cons-threshold (* 100 gc-cons-threshold))
;;; ログの記録行数を増やす
(setq message-log-max 10000)
;;; ミニバッファを再帰的に呼び出せるようにする
(setq enable-recursive-minibuffers t)
;;; ダイアログボックスを使わないようにする
(setq use-dialog-box nil)
(defalias 'message-box 'message)
;;; 履歴をたくさん保存する
(setq history-length 1000)
;;; キーストロークをエコーエリアに早く表示する
(setq echo-keystrokes 0.1)
;;; 大きいファイルを開こうとしたときに警告を発生させる
;;; デフォルトは10MBなので25MBに拡張する
(setq large-file-warning-threshold (* 25 1024 1024))
;;; ミニバッファで入力を取り消しても履歴に残す
;;; 誤って取り消して入力が失われるのを防ぐため
(defadvice abort-recursive-edit (before minibuffer-save activate)
(when (eq (selected-window) (active-minibuffer-window))
(add-to-history minibuffer-history-variable (minibuffer-contents))))
;;; yesと入力するのは面倒なのでyで十分
(defalias 'yes-or-no-p 'y-or-n-p)
