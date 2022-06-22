(setq use-package-always-ensure t)
(setq use-package-ensure-function 'ignore)
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
(setq-default use-dialog-box nil)
(setq-default use-short-answers t)
(global-hl-line-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq display-line-numbers-mode t)
(setq display-line-numbers 'relative)
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq mouse-wheel-progressive-speed nil)
(setq custom-safe-themes t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package color-theme-sanityinc-tomorrow)
;; (color-theme-sanityinc-tomorrow-night)

(use-package emacs
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t
        modus-themes-region '(bg-only)
        modus-themes-syntax '(faint alt-syntax green-strings)
        ;; modus-themes-tabs-accented t
modus-themes-fringes '(intense)
        modus-themes-mode-line '(borderless accented))
  :config
  ;; Load the theme of your choice:
  (load-theme 'modus-vivendi) ;; OR (load-theme 'modus-vivendi)
  )


(use-package pdf-tools)

(set-face-attribute 'default nil
                    :family "Hack Nerd Font"
                    :height 140
                    :weight 'normal
                    :width  'normal)

(use-package undo-tree
  :bind ("C-c _" . undo-tree-visualize)
  :config
  (global-undo-tree-mode t)
  (unbind-key "M-_" undo-tree-map))

(use-package multiple-cursors
  :bind (("C-c C-d" . mc/edit-lines)
         ("C-d" . mc/mark-next-like-this)
         ;("C-D" . mc/mark-previous-like-this)
         ("C-D" . mc/mark-all-like-this)))
         ;("C-\"" . mc/skip-to-next-like-this)
         ;("C-:" . mc/skip-to-previous-like-this)))

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

(use-package mood-line
  :config (mood-line-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package treemacs)

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once))

(use-package treemacs-magit
  :after (treemacs magit))

(use-package vertico
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package marginalia
  :config (marginalia-mode))

(use-package orderless
  :custom (completion-styles '(orderless)))

;; (use-package consult
;;   :bind (("C-c i"   . #'consult-imenu)
;;          ("C-c b"   . #'consult-buffer)
;;          ("C-x b"   . #'consult-buffer)
;;          ("C-c r"   . #'consult-recent-file)
;;         ; ("C-c y"   . #'pt/yank-pop)
;;          ("C-c R"   . #'consult-bookmark)
;;          ("C-c `"   . #'consult-flymake)
;;          ("C-c h"   . #'consult-ripgrep)
;;          ("C-x C-f" . #'find-file)
;;          ("C-h a"   . #'consult-apropos))
;;   :custom
;;   (completion-in-region-function #'consult-completion-in-region)
;;   (xref-show-xrefs-function #'consult-xref)
;;   (xref-show-definitions-function #'consult-xref)
;;   (consult-project-root-function #'deadgrep--project-root))

(use-package ctrlf
  :config (ctrlf-mode))

(use-package prescient
  :config (prescient-persist-mode))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package dockerfile-mode)
(use-package docker-compose-mode)

(use-package erlang)

(use-package elixir-mode)
(setq lsp-elixir-mix-env "dev")

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package typescript-mode)
(use-package web-mode
  :hook ((web-mode . lsp)
         (typescript-tsx-mode . lsp))
  :mode (("\\.html\\'" . web-mode)
         ("\\.html\\.eex\\'" . web-mode)
         ("\\.html\\.tera\\'" . web-mode)
         ("\\.tsx\\'" . typescript-tsx-mode))
  :init
  (define-derived-mode typescript-tsx-mode typescript-mode "TypeScript-tsx")
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))

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

(use-package haskell-mode)
(use-package lsp-haskell)
;; (setq lsp-haskell-server-path "/etc/profiles/per-user/dmanik/bin/haskell-language-server")

(use-package lsp-mode
  :hook ((rustic elixir-mode nix-mode haskell-mode). lsp-deferred)
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
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.0)
  :hook (emacs-lisp-mode . company-mode))

;; (use-package company-tabnine
;;   :config
;;   (add-to-list 'company-backends #'company-tabnine)
;;   (setq company-idle-delay 0)
;;   (setq company-show-numbers t))

(use-package direnv
  :ensure t
  :config
  (direnv-mode))
