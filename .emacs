(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq ring-bell-function 'ignore)

(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message user-login-name
      initial-scratch-message nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(load-theme 'gruber-darker t)
(add-to-list 'default-frame-alist '(font . "Iosevka-20"))

;; C mode defaults
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)

(add-hook 'c-mode-hook (lambda ()
                         (interactive)
                         (c-toggle-comment-style -1)))

;; Dired
(require 'dired-x)
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$")
      dired-listing-switches "-alh"
      dired-mouse-drag-files t)
(setq-default dired-dwim-target t)

;;; backup/autosave
(defvar backup-dir (expand-file-name "~/.emacs.d/backup/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosave/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

(setq default-directory "")
(add-hook 'emacs-startup-hook
          (lambda ()
            (dired default-directory)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'move-text)
(global-set-key (kbd "M-<up>")   #'move-text-up)
(global-set-key (kbd "M-<down>") #'move-text-down)

;; Custom keybinds
(global-set-key (kbd "C-c d") 'duplicate-line)
