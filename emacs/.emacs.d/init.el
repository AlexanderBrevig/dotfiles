;; As soon as possible
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; My actual config
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-ui yasnippet-snippets yasnippet flycheck go-mode company-lsp company lsp-mode evil-org doom-themes doom-modeline evil which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 120 :width normal :foundry "PfEd" :family "JetBrains Mono")))))
