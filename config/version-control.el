;;; -*- lexical-binding: t -*-

(use-package magit
  :commands (magit-status)
  :bind (("C-x g" . magit-status)))

(use-package diff-hl
  :hook ((dired-mode . diff-hl-dired-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  (global-diff-hl-mode t))
