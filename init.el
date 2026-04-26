(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(column-number-mode t)
 '(custom-enabled-themes '(tsdh-dark))
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-selected-packages '(
			       go-mode
			       magit
			       multiple-cursors
			       org-roam))
 '(ring-bell-function 'ignore)
 '(tool-bar-mode nil)
 '(visible-bell t)
 '(which-key-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight regular :height 158 :width normal))))
 '(org-drawer ((t (:foreground "steel blue")))))

;; compile
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)

;; jump to error in compile window
;; (setq compilation-skip-threshold 2)

;; colorize compilation buffer
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point-max)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; multiple-cursors
;; https://github.com/magnars/multiple-cursors.el
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; c-mode
(setq c-default-style "linux"
      c-basic-offset 4)
(c-set-offset 'case-label '+)

;; auto revert mode
(global-auto-revert-mode 1)

;; set kill-emacs keybind to C-x m (mail-to) instead
(global-set-key (kbd "C-x m") nil) ;; email-to
(global-set-key (kbd "C-x C-c") nil)
(global-set-key (kbd "C-x m") #'kill-emacs)

; set C-x <escape> instead
(global-set-key (kbd "C-x <f12>") #'save-buffers-kill-emacs)

;; c3
(setq treesit-language-source-alist
  '((c3 "https://github.com/c3lang/tree-sitter-c3")))
(add-to-list 'load-path "/home/adam/.emacs.d/repos/c3-ts-mode")
(require 'c3-ts-mode)

;; hungarian-postfix
(add-to-list 'load-path "/home/adam/.emacs.d/repos/hungarian-postfix")
(require 'hungarian-postfix)

