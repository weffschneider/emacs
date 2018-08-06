
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/package")
(load "~/.emacs.d/ctags")
(load "~/.emacs.d/org")
(add-to-list 'load-path "~/.emacs.d/color-themes/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(org-startup-truncated nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 151 :width normal)))))

(require 'magit)
(setq same-window-buffer-names '("*magit-log*"))
(setq same-window-buffer-names '("*magit-status*"))
(setq same-window-buffer-names '("*magit-branch-manager*"))

(global-set-key (kbd "C-S-S") 'magit-status)
(global-set-key (kbd "C-S-B") 'magit-branch-manager)
(global-set-key (kbd "C-S-L") 'magit-log)

(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-charcoal-black)

(setq backup-directory-alist `(("." . "~/.saves")))

(setq c-default-style "linux"
      c-basic-offset 2)

(setq-default indent-tabs-mode nil)

;; open buffer menu in same window
(global-set-key "\C-x\C-b" 'buffer-menu)

;; switch between .c and .h
(defvar my-c-other-file-alist
  '(("\\.c\\'" (".h"))
    ("\\.h\\'" (".c"))
    ("\\.h\\'" (".cc"))
    ("\\.cc\\'" (".h"))
    ))

(setq-default ff-other-file-alist 'my-c-other-file-alist)

(add-hook 'c-initialization-hook (lambda ()
    (define-key c-mode-base-map [(meta o)] 'ff-get-other-file))
)

;; enable for all programming modes
(add-hook 'prog-mode-hook 'subword-mode)
(add-hook 'text-mode-hook 'subword-mode)

(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-g") 'mc/mark-all-like-this)
(global-set-key (kbd "C-M->") 'mc/skip-to-next-like-this)

(setq tramp-default-method "ssh")

(c-set-offset 'case-label '+)

(set-face-background 'vertical-border "gray")
(set-face-foreground 'vertical-border (face-background 'vertical-border))
