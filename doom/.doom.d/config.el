;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Alexander Brevig"
      user-mail-address "alexanderbrevig@gmail.com")

;; Doom config
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 16 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 14))

(setq doom-theme 'doom-gruvbox)

(setq doom-modeline-mode t)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/github.com/org")
(setq org-roam-directory "~/github.com/org-roam")

(setq confirm-kill-emacs 'nil)

;; LSP and check
(flycheck-mode 1)

;; Markdown style
(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "FiraCode Nerd Font"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.8))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.2)))))
