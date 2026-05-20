(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/vetra-theme"))

(setq inhibit-startup-screen t
      initial-scratch-message nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(show-paren-mode 1)
(set-fringe-mode 0)
(global-display-line-numbers-mode 1)

(load-theme 'vetra t)
(add-to-list 'default-frame-alist '(font . "Iosevka-20"))

;; Indentation
(setq-default tab-width 8)
(setq c-basic-offset 8)

;; Whitespaces
(setq-default show-trailing-whitespace t)

;; Dired
(require 'dired-x)
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$")
      dired-listing-switches "-lah"
      dired-mouse-drag-files t)
(setq-default dired-dwim-target t)

;; Backup/autosave
(defvar backup-dir (expand-file-name "~/.emacs.d/backup/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosave/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

;; Move text
;; https://github.com/emacsfodder/move-text
(require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;; Custom keybinds
(global-set-key (kbd "C-c d") 'duplicate-line)

;; Allow
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; https://endlessparentheses.com/ansi-colors-in-the-compilation-buffer-output.html
(require 'ansi-color)
(defun endless/colorize-compilation ()
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)
