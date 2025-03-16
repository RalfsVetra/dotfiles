(setq inhibit-splash-screen 1
      inhibit-startup-message 1
      inhibit-startup-echo-area-message 1
      initial-scratch-message nil)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(add-to-list 'default-frame-alist '(font . "Iosevka-20"))
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(setq custom-file "~/.emacs.custom.el")
(when (file-exists-p custom-file)
  (load-file custom-file))

;;; Load custom libraries
(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'move-text)
(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

(require 'rust-mode)
(require 'python)

(load-theme 'gruber-darker 1)
