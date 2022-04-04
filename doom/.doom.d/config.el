;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(doom-load-envvars-file "~/.doom.d/myenv")

(setq user-full-name "Alexander Brevig"
      user-mail-address "alexanderbrevig@gmail.com")

;; Doom config
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 16)
      doom-big-font (font-spec :family "FiraCode Nerd Font" :size 22)
      doom-variable-pitch-font (font-spec :family "Overpass Nerd Font" :size 14))

(setq doom-theme 'doom-gruvbox)

(setq doom-modeline-mode t)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/github.com/org")
(setq org-roam-directory "~/github.com/org-roam")

(setq confirm-kill-emacs 'nil
      evil-vsplit-window-right t
      evil-split-window-below t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))

(setq scroll-margin 5)

;; LSP and check
(flycheck-mode 1)
(format-all-mode 1)
