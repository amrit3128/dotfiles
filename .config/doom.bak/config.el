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

;; Relative Line Numbering
;; set type of line numbering (global variable)
(setq display-line-numbers-type 'relative)
;; activate line numbering in all buffers/modes
;; (global-display-line-numbers-mode)
(set-face-attribute 'default nil :height 110)

;; Configure org-babel for jupyter
(use-package! jupyter
  :defer t
  :init
  (setq org-babel-default-header-args:jupyter-python
        '((:session . "py") (:kernel . "python3")))
  (setq ob-async-no-async-languages-alist '("jupyter-python")))

(after! org
  (require 'ob-jupyter))

;; Setting the background blur
(add-to-list 'default-frame-alist '(alpha-background . 90))

(setq
 confirm-kill-emacs nil
 undo-tree-mode 1
 treemacs-is-never-other-window nil
 display-line-numbers 'relative
 projectile-globally-ignored-directories '("env" ".git" "venv" ".venv")
 projectile-project-search-path '("~/git_repos/" "~/codes/"))

;; Dashboard
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)

(defun my-weebery-is-always-greater ()
  (let* ((banner '("███████╗███╗   ███╗ █████╗  ██████╗███████╗"
                   "██╔════╝████╗ ████║██╔══██╗██╔════╝██╔════╝"
                   "█████╗  ██╔████╔██║███████║██║     ███████╗"
                   "██╔══╝  ██║╚██╔╝██║██╔══██║██║     ╚════██║"
                   "███████╗██║ ╚═╝ ██║██║  ██║╚██████╗███████║"
                   "╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝"
                   "         the editor that god uses          "))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))
(setq +doom-dashboard-ascii-banner-fn #'my-weebery-is-always-greater)


;; (require 'vertico-posframe)
;; (vertico-posframe-mode 1)


;; (custom-set-faces
;;   '(org-level-1 ((t (:inherit outline-1 :height 1.33))))
;;   '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
;;   '(org-level-3 ((t (:inherit outline-3 :height 1.15))))
;;   '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
;;   '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
;;   '(org-level-6 ((t (:inherit outline-6 :height 1.1))))
;;   '(org-level-7 ((t (:inherit outline-7 :height 1.1))))
;;   '(org-level-8 ((t (:inherit outline-8 :height 1.1))))
;; )

;; (after! org
;;   (setq
;;    org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
;;    org-todo-keyword-faces
;;    '(("TODO" :foreground "#7c7c75" :weigth normal :underline t)
;;      ("WAITING" :foreground "#9f7efe" :weigth normal :underline t)
;;      ("INPROGRESS" :foreground "#0098dd" :weigth normal :underline t)
;;      ("DONE" :foreground "#50a14f" :weigth normal :underline t)
;;      ("CANCELLED" :foreground "#ff6480" :weigth normal :underline t))
;;    org-agenda-files (directory-files-recursively "~/org-notes/" "\.org$")
;;    ))

(require 'lsp-mode)

(add-hook 'go-mode-hook #'lsp-deferred)
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(lsp-register-custom-settings
 '(("gopls.completeUnimported" t t)
   ("gopls.staticcheck" t t)))

;; (undo-tree-mode 1)

;; (require 'slime)
;; (slime-setup '(slime-fancy slime-quicklisp slime-asdf slime-mrepl))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred
