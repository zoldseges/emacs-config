;;; -*- lexical-binding: t -*-

;;; Init profiling
;; Uncomment this and after startup do 'M-x profiler-report'
;; to see why emacs starts up slow.
;; (profiler-start 'cpu+mem)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(column-number-mode t)
 '(custom-enabled-themes '(tsdh-dark))
 '(dired-dwim-target t)
 '(dired-hide-details-preserved-columns nil)
 '(dired-listing-switches "-al --time-style=long-iso")
 '(dired-use-ls-dired t)
 '(global-hl-line-mode t)
 '(global-kkp-mode t nil nil "to make some shortcuts work in the terminal too")
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-startup-truncated nil)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-quickstart t)
 '(package-selected-packages '(kkp magit markdown-mode multiple-cursors pdf-tools xclip))
 '(tool-bar-mode nil)
 '(truncate-lines t nil nil "Let lines go off-screen")
 '(which-key-mode t)
 '(xclip-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight regular :height 158 :width normal))))
 '(hl-line ((t (:extend t :background "grey27"))))
 '(org-drawer ((t (:foreground "steel blue")))))


;;; ----  Package setup (see notes/package-setup.md)  ----
;; Auto-installs missing packages on startup.
;; To upgrade, run
;; M-x package-refresh-contents then
;; M-x package-install-selected-packages.

;; Load package.el so custom-set-variables can apply package-selected-packages.
(require 'package)

;; Install missing packages (network errors won't abort init).
(let ((missing (seq-some
                (lambda (p) (not (package-installed-p p)))
                package-selected-packages)))
  (when missing
    (with-demoted-errors "Package error: %S"
      ;; Refresh archive index so new packages can be found.
      (package-refresh-contents)
      ;; Install everything in package-selected-packages that's missing.
      (package-install-selected-packages t))))

;; Generate quickstart cache if it doesn't exist yet.
(unless (file-exists-p (concat package-quickstart-file "c"))
  (package-quickstart-refresh))

;;; ----------------  End Package setup  -----------------

;; compile
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)

;; jump to error in compile window
;; (setq compilation-skip-threshold 2)

;; colorize compilation buffer
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point-max)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; multiple cursors
;; you'll need package "kkp" to make these shortcuts work in the terminal
;; and also you need a terminal which supports "Kitty Keyboard Protocol"
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)
;; conflicts with kitty "reload configuration
;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(setq mc/always-run-for-all t)

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
