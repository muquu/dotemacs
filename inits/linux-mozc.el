(require 'mozc)
(setq default-input-method "japanese-mozc")

(require 'mozc-popup)
(setq mozc-candidate-style 'popup)

(require 'ac-mozc)
(define-key ac-mode-map (kbd "C-c C-SPC") 'ac-complete-mozc)


;; org-mode
(require 'org)
(add-to-list 'ac-modes 'org-mode)

(defun my-ac-mozc-setup ()
  (setq ac-sources
        '(ac-source-mozc ac-source-ascii-words-in-same-mode-buffers))
  (set (make-local-variable 'ac-auto-show-menu) 0.2))

(add-hook 'org-mode-hook 'my-ac-mozc-setup)
