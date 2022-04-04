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

(setq confirm-kill-emacs nil)

;; LSP and check
(flycheck-mode 1)
(format-all-mode 1)
