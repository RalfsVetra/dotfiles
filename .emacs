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
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (c-set-style "linux-tabs-only")))

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

(setq default-directory "/home")
(add-hook 'emacs-startup-hook
          (lambda ()
            (dired default-directory)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'move-text)
(global-set-key (kbd "M-<up>")   #'move-text-up)
(global-set-key (kbd "M-<down>") #'move-text-down)

;; Custom keybinds
(global-set-key (kbd "C-c d") 'duplicate-line)
