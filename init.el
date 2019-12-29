(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command "/usr/bin/pandoc" t)
 '(org-agenda-files (quote ("~/Dropbox/PhD/ideas.org")))
 '(package-selected-packages
   (quote
    (ess linum-relative magithub company-reftex org-plus-contrib pyvenv virtualenv elpy yasnippet-snippets which-key use-package toml-mode symon spacemacs-theme spaceline smex rg restart-emacs rainbow-delimiters racer ox-reveal org-ref org-bullets monokai-theme monokai-alt-theme helm-swoop golden-ratio git-timemachine git-gutter flycheck-rust flycheck-package flx-ido exec-path-from-shell evil-terminal-cursor-changer evil-nerd-commenter evil-magit evil-leader evil-escape dmenu diminish dashboard csharp-mode company-statistics company-math company-irony company-auctex color-theme clang-format cargo beacon avy aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
