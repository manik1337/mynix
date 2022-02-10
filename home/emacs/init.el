(setq use-package-always-ensure t)
(setq use-package-ensure-function 'ignore)
;; optional. makes unpure packages archives unavailable
(setq package-archives nil)

(setq package-enable-at-startup nil)
(package-initialize)

(blink-cursor-mode -1)
(show-paren-mode t)
(column-number-mode t)
(global-hl-line-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq mouse-wheel-progressive-speed nil)

(use-package projectile
  :commands projectile-mode
  :init
  (projectile-mode +1)
  :bind
  (:map projectile-mode-map
    ("C-f" . projectile-command-map)))

(use-package magit
  :bind (("C-x g" . magit-status)))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package rust-mode)

(use-package erlang)

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (evil-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package nord-theme)
(load-theme 'nord t)

(set-face-attribute 'default nil
                    :family "Hack Nerd Font"
                    :height 120
                    :weight 'normal
                    :width  'normal)
