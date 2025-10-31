;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tsdh-dark))
 '(menu-bar-mode nil)
 '(package-selected-packages '(magit multiple-cursors))
 '(ring-bell-function 'ignore)
 '(tool-bar-mode nil)
 '(visible-bell t)
 '(which-key-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight regular :height 218 :width normal)))))

;; compile
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)

;; jump to error in compile window
(setq compilation-skip-threshold 2)

;; multiple-cursors
;; https://github.com/magnars/multiple-cursors.el
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(setq c-default-style "linux"
      c-basic-offset 4)
