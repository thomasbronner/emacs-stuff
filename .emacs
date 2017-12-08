;; To use the MELPA repository
(require 'package) 
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages
   (quote
    (company sql-upcase auctex ## clojure-cheatsheet clojure-mode-extra-font-locking paredit cider)))
 '(recentf-mode t)
 '(show-paren-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; auctex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;;disable annoying bell
(setq visible-bell 1)

;;replace in selection
(delete-selection-mode 1)

;;shift click extends selection
(define-key global-map (kbd "<S-down-mouse-1>") 'mouse-save-then-kill)

(setq default-directory "f:/Google Drive/")

;; UTF-8 as default encoding
(set-language-environment "UTF-8")

;;serveur castor pour le mode sql
(setq sql-postgres-login-params
      '((user :default "castor")
        (database :default "castor")
        (server :default "37.187.224.21")
        (port :default 5432)))

;;no truncate line in sql mode
(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))
;;capitalize SQL keywords
(when (require 'sql-upcase nil :noerror)
  (add-hook 'sql-mode-hook 'sql-upcase-mode)
  (add-hook 'sql-interactive-mode-hook 'sql-upcase-mode))

(setq sql-upcase-mixed-case t)

;;show matching parenthese
(show-paren-mode 1)

;;cider
(setq cider-eval-result-duration nil) ;;conserver les resultats des eval a l'écran
