;;; -*- lexical-binding: t -*-
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
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-startup-truncated nil)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages '(magit markdown-mode multiple-cursors pdf-tools xclip))
 '(tool-bar-mode nil)
 '(truncate-lines t nil nil "Let lines go off-screen")
 '(which-key-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight regular :height 158 :width normal))))
 '(hl-line ((t (:extend t :background "grey27"))))
 '(org-drawer ((t (:foreground "steel blue")))))

;;; Packages

(defun package-archives-stale-p (seconds)
  "Return t if package archives are older than SECONDS."
  (let ((dir (expand-file-name "archives" package-user-dir)))
    (or (not (file-exists-p dir))
        (> (float-time (time-subtract nil
                         (file-attribute-modification-time
                          (file-attributes dir))))
           seconds))))

(defun setup-and-refresh-packages (refresh-interval)
  "Initialize the package manager, refresh archives if older than
REFRESH-INTERVAL seconds, and install missing selected packages."
  (package-initialize)
  (when (package-archives-stale-p refresh-interval)
    (package-refresh-contents))
  (package-install-selected-packages t))

(setup-and-refresh-packages (* 7 24 60 60)) ; 1 week

;;; End Packages

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
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
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
