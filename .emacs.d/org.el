(require 'org)

(add-to-list 'auto-mode-alist '("\\.zpc\\'" . org-mode))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq truncate-lines 'nil)
