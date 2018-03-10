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
;; mail
(setq user-mail-address "adepu.dinesh.a@gmail.com")
(setq user-full-name "Dinesh A")

(setq make-backup-file nil)
(setq auto-save-default nil)
(setq scroll-conservatively 100)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq ring-bell-function 'ignore)

(when window-system (global-hl-line-mode t))

(global-prettify-symbols-mode t)

;; Electric auto pair
(electric-pair-mode t)

(desktop-save-mode 1)

;; Bookmarks file in dropbox.
(setq bookmark-default-file "~/Dropbox/common/emacs/bookmarks.bmk" bookmark-save-flag 1)

;; Copy to clipboard
(fset 'evil-visual-update-x-selection 'ignore)
(setq temporary-file-directory "~/.emacs.d/tmp/")

;; kill all oher buffers
(defun nuke-all-buffers ()
  (interactive)
  (mapcar 'kill-buffer (buffer-list))
  (delete-other-windows))

(global-set-key (kbd "C-x K") 'nuke-all-buffers)

(defun kill-other-buffers ()
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)) )
      (kill-buffer buffer))))
(global-set-key (kbd "C-x L") 'kill-other-buffers)


(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

(use-package restart-emacs
  :ensure t
  :bind (("C-x M-c" . restart-emacs)))

(use-package evil
  :ensure t
  :diminish evil
  :init (evil-mode 1)
  (setq evil-insert-state-cursor '((bar . 1) "white")
        evil-visual-state-cursor '(box "dark orange")
        evil-normal-state-cursor '(box "white"))
  :bind (:map
         evil-insert-state-map
         ([S-left]     . windmove-left)
         ([S-right]    . windmove-right)
         ([S-up]     . windmove-up)
         ([S-down]    . windmove-down)
         ("SPC" . nil)
         :map
         evil-normal-state-map
         (";" . evil-ex)
         (":"   .       evil-repeat-find-char)
         :map    evil-motion-state-map
         ([S-left]     . windmove-left)
         ([S-right]    . windmove-right)
         ([S-up]     . windmove-up)
         ([S-down]    . windmove-down)
         ))


(use-package evil-leader
  :ensure t
  :diminish evil-leader
  :init (global-evil-leader-mode)
  :config (progn
            (evil-leader/set-leader ",")
            (evil-leader/set-key "b" 'switch-to-buffer)
            (evil-leader/set-key "s" 'save-buffer)
            (evil-leader/set-key "e" 'find-file)
            (evil-leader/set-key "1" 'delete-other-windows)
            (evil-leader/set-key "x" 'bookmark-jump)
            (evil-leader/set-key "0" 'delete-window)
            (evil-leader/set-key "3" 'split-window-right)
            (evil-leader/set-key "2" 'split-window-below)
            (evil-leader/set-key "." 'elpy-goto-definition-other-window)
            (evil-leader/set-key "," 'elpy-goto-definition)
            (evil-leader/set-key "f" 'ff-find-other-file)
            (evil-leader/set-key "c" 'recentf-open-files)
            (evil-leader/set-key "r" 'org-ref-helm-insert-ref-link)
            (evil-leader/set-key "l" 'org-ref-helm-insert-label-link)
            (evil-leader/set-key "w" 'ispell-word)
            (evil-leader/set-key "g" 'magit-status)
            (evil-leader/set-key "z" 'fzf)
            (evil-leader/set-key "n" 'windmove-left)
            (evil-leader/set-key "m" 'windmove-right)
            (evil-leader/set-key "<SPC>" 'windmove-down)
            (evil-leader/set-key "p" 'windmove-up)
            (evil-leader/set-key "o" 'org-ref-open-bibtex-notes)
            (evil-leader/set-key "`" 'org-edit-src-exit)
            (evil-leader/set-key "u" 'org-ref-open-pdf-at-point)
            (evil-leader/set-key "k" 'kill-this-buffer)))

(use-package key-chord
  :ensure t)
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

;; evil cursor terminal
(use-package evil-terminal-cursor-changer
  :ensure t)
(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate) ; or (etcc-on)
  )


(setq evil-motion-state-cursor 'box)  ; █
(setq evil-visual-state-cursor 'box)  ; █
(setq evil-normal-state-cursor 'box)  ; █
(setq evil-insert-state-cursor 'bar)  ; ⎸
(setq evil-emacs-state-cursor  'hbar) ; _

;;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
  In Delete Selection mode, if the mark is active, just deactivate it;
  then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)


(use-package magit
  :ensure t)
(global-auto-revert-mode t)
(use-package git-gutter
  :ensure t
  :init
  )
(global-git-gutter-mode 0)
;; disable evil in timemachine
;; @see https://bitbucket.org/lyro/evil/issue/511/let-certain-minor-modes-key-bindings
(eval-after-load 'git-timemachine
  '(progn
     (evil-make-overriding-map git-timemachine-mode-map 'normal)
     ;; force update evil keymaps after git-timemachine-mode loaded
     (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps)))

(use-package git-timemachine
  :ensure t
  )

(use-package evil-magit
  :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :init
  (progn
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
    (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)))

(use-package aggressive-indent
  :ensure t
  :init (global-aggressive-indent-mode))

(use-package golden-ratio                 ; Auto resize windows
  :ensure t
  :diminish golden-ratio-mode
  :config
  (golden-ratio-mode 1)
  (setq golden-ratio-auto-scale t)
  (setq golden-ratio-extra-commands
        (append golden-ratio-extra-commands
                '(evil-window-left
                  evil-window-right
                  evil-window-up
                  evil-window-down))))
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (org-bullets beacon spacemacs-theme which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 148 :width normal :foundry "nil" :family "xos4 Terminus")))))
