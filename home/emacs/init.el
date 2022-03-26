(setq use-package-always-ensure t)
(setq use-package-ensure-function 'ignore)
;; optional. makes unpure packages archives unavailable
(setq package-archives nil)

(setq package-enable-at-startup nil)
(package-initialize)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(blink-cursor-mode -1)
(show-paren-mode t)

(column-number-mode t)

(global-auto-revert-mode 1)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-display-line-numbers-mode t)
(setq display-line-numbers 'relative)
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(global-hl-line-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq inhibit-startup-screen t)
(setq make-backup-files nil)

(setq mouse-wheel-progressive-speed nil)
(setq custom-safe-themes t)

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-oceanic-next)

  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(set-face-attribute 'default nil
                    :family "Hack Nerd Font"
                    :height 120
                    :weight 'normal
                    :width  'normal)

(use-package modus-themes
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil
        modus-themes-region '(bg-only no-extend)))

(use-package beacon
  :init
  (beacon-mode 1))

(use-package vterm)

(use-package vterm-toggle
  :custom
  (vterm-toggle-fullscreen-p nil "Open a vterm in another window.")
  (vterm-toggle-scope 'project)
  :bind (("C-c t" . #'vterm-toggle)
         :map vterm-mode-map
         ("C-\\" . #'popper-cycle)
         ;("s-t" . #'vterm) ; Open up new tabs quickly
         ;("s-v" . #'vterm-yank)
         ))

(use-package smartparens
  :hook (prog-mode . smartparens-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-symbol-word-search t)
  (evil-mode))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package command-log-mode)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line))
  :config
  (setq ivy-re-builders-alist
        '((swiper . regexp-quote)
          (t      . ivy--regex-fuzzy)))
  (ivy-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package swiper)

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . helpful-function)
  ([remap describe-symbol] . helpful-symbol)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package treemacs)

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once))

(use-package treemacs-magit
  :after (treemacs magit))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ; (setq projectile-project-search-path '(("~/ws/" . 2)))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Docker
(use-package dockerfile-mode)

;; Erlang
(use-package erlang)

;; Elixir
(use-package elixir-mode)

;; Nix
(use-package nix-mode
  :mode "\\.nix\\'")

;; Rust
(use-package rustic
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-k" . lsp-find-references)
              ;;("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status)))

(use-package lsp-mode
  :hook ((rustic elixir-mode nix-mode). lsp-deferred)
  :commands lsp
  :config
  (setq lsp-auto-guess-root t)
  (setq lsp-log-io nil)
  (setq lsp-restart 'auto-restart)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-signature-render-documentation nil)
  (setq lsp-eldoc-hook nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-semantic-tokens-enable nil)
  (setq lsp-enable-folding nil)
  (setq lsp-enable-imenu nil)
  (setq lsp-enable-snippet nil)
  (setq read-process-output-max (* 1024 1024)) ;; 1MB
  (setq gc-cons-threshold 100000000)
  (setq lsp-idle-delay 0.5))

;;  :custom
;;  (lsp-rust-analyzer-cargo-watch-command "clippy")
;;  (lsp-eldoc-render-all t)
;;  (lsp-idle-delay 0.6)
;;  (lsp-rust-analyzer-server-display-inlay-hints t)
;;  :config
;;  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

(use-package company
  :bind (:map prog-mode-map
         ("C-i" . company-indent-or-complete-common)
         ("C-M-i" . counsel-company))
  :hook (emacs-lisp-mode . company-mode))

;; (use-package company-tabnine
;;   :config
;;   (add-to-list 'company-backends #'company-tabnine)
;;   (setq company-idle-delay 0)
;;   (setq company-show-numbers t))
