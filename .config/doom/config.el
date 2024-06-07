;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
(setq doom-theme 'catppuccin)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Kill emacs
(setq confirm-kill-emacs nil)

;; Relative Line Numbering
;; set type of line numbering (global variable)
(setq display-line-numbers-type 'relative)
;; activate line numbering in all buffers/modes
;; (global-display-line-numbers-mode)

(set-face-attribute 'default nil :height 110)

;; Setting the background blur
(add-to-list 'default-frame-alist '(alpha-background . 90))

;; Configure org-babel for jupyter
(use-package! jupyter
  :defer t
  :init
  (setq org-babel-default-header-args:jupyter-python
        '((:session . "py") (:kernel . "python3")))
  (setq ob-async-no-async-languages-alist '("jupyter-python")))

(after! org
  (require 'ob-jupyter))

;; Tress Sitter
;; (use-package! tree-sitter
;;   :hook ((python-mode . tree-sitter-hl-mode)
;;          (lua-mode . tree-sitter-hl-mode)
;;          (rust-mode . tree-sitter-hl-mode)
;;          )
;;   :config
;;   (require 'tree-sitter-langs))

;; (use-package! tree-sitter-langs
;;   :after tree-sitter)

;; Ensure lsp-mode is enabled for Python
;; (use-package! lsp-mode
;;   :commands (lsp lsp-deferred)
;;   :hook ((python-mode . lsp-deferred))
;;   :config
;;   (setq lsp-enable-on-type-formatting nil
;;         lsp-signature-auto-activate nil
;;         lsp-headerline-breadcrumb-enable nil))

;; Use lsp-pyright for Python
;; (use-package! lsp-pyright
;;   :after lsp-mode
;;   :config
;;   (setq lsp-pyright-disable-language-service nil
;;         lsp-pyright-disable-organize-imports nil
;;         lsp-pyright-auto-import-completions t
;;         lsp-pyright-venv-path "~/.virtualenvs")
;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-pyright)
;;                          (lsp-deferred))))  ;; or lsp

;; Optional: Configure company-mode for autocompletion
;; (use-package! company
;;   :config
;;   (setq company-idle-delay 0.1
;;         company-minimum-prefix-length 1
;;         company-show-numbers t))

;; Optional: Configure flycheck for on-the-fly syntax checking
;; (use-package! flycheck
;;   :hook (lsp-mode . flycheck-mode)
;;   :config
;;   (setq flycheck-python-pyright-executable "pyright"))

