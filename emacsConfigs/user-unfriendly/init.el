;; basic init.el
;; small change to test .gitignore
;;;;;;;;;;;;;;;; garbage collection ;;;;;;;;;;;;;;;
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
	gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;......Startup Related Stuff 

;;..... makes commands from "package" module present
(require 'package)
(setq package-enable-at-startup nil)


;;..... package archives

(setq package-archives '(("ELPA"  . "https://tromey.com/elpa/")
			 ("gnu"   . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)

;; when there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))


;;..... Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))



;;..... Set specific file for Emacs to  store variable changes (instead of adding them to init.el)
(when (file-readable-p "~/.emacs.d/custom.el")
  (setq custom-file "~/.emacs.d/custom.el")
  (load custom-file))


(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

;; Moving to config.org to avoid package conflicts, or can I do it here?
(when (file-readable-p "~/.emacs.d/email.org")
    (org-babel-load-file (expand-file-name "~/.emacs.d/email.org")))
;; if put into the same when condition, should be done as synchronous process (in order?)
