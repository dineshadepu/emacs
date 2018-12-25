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

(add-to-list 'default-frame-alist '(background-color . "lightgray"))
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command "/usr/bin/pandoc" t)
 '(org-agenda-files
   (quote
    ("~/code_phd/prestige/README.org" "~/Dropbox/Research/todo.org")))
 '(package-selected-packages
   (quote
    (gtypist doom-modeline eyebrowse sage-shell-mode yasnippet-snippets writegood-mode which-key virtualenv vimrc-mode use-package toml-mode toc-org tiny spacemacs-theme spaceline smex smartparens rust-playground rg restart-emacs rainbow-delimiters racket-mode racer py-yapf ox-reveal org-ref org-pdfview org-bullets org-autolist ob-ipython nlinum-relative neotree monokai-theme magithub linum-relative irony-eldoc intellij-theme htmlize helm-swoop helm-make helm-fuzzier google-c-style golden-ratio git-timemachine git-gutter ggtags fzf flycheck-rust flycheck-package flycheck-irony flx-ido exec-path-from-shell evil-terminal-cursor-changer evil-nerd-commenter evil-magit evil-leader ess elpy elisp-slime-nav dired-details diminish dashboard counsel-gtags company-statistics company-math company-irony-c-headers company-irony company-c-headers company-auctex color-theme clang-format cdlatex cargo beacon basic-theme avy aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
