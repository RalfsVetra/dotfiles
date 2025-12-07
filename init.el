(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))
(add-to-list 'custom-theme-load-path (file-name-as-directory "~/.emacs.d/themes"))

(setq display-line-numbers-type 'relative)
(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message user-login-name
      initial-scratch-message nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(show-paren-mode 1)
(set-fringe-mode 0)
(global-display-line-numbers-mode 1)

(load-theme 'focus)
(add-to-list 'default-frame-alist '(font . "Iosevka-20"))

;; C mode defaults
(setq-default c-basic-offset 4)
(add-hook 'c-mode-hook (lambda ()
                         (interactive)
                         (c-toggle-comment-style -1)))

;; Dired
(require 'dired-x)
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$")
      dired-listing-switches "-alh"
      dired-mouse-drag-files t)
(setq-default dired-dwim-target t)

;; Backup/autosave
(defvar backup-dir (expand-file-name "~/.emacs.d/backup/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosave/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

;; Move text
(require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;; License templates
(require 'license-templates)

;; Nasm mode
(add-to-list 'auto-mode-alist '("\\.asm\\'" . nasm-mode))

;; Custom keybinds
(global-set-key (kbd "C-c d") 'duplicate-line)
