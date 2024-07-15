;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Amritanshu"
      user-mail-address "tripathyamritanshu7@gmail.com")

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
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Org/")


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
(set-face-attribute 'default nil :height 170)

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

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))  ; or lsp-deferred

(setq custom-file null-device)

(after! evil
  (map! :i "C-h" #'backward-char
        :i "C-j" #'next-line
        :i "C-k" #'previous-line
        :i "C-l" #'forward-char
        ;; :n "C-j" #'evil-window-down
        ;; :n "C-k" #'evil-window-up
        ;; :n "C-h" #'evil-window-left
        ;; :n "C-l" #'evil-window-right
        ;; :n "C-q" #'evil-window-delete
        ;; :n "M-q" #'kill-current-buffer
        ;; :n "M-w" #'+workspace/close-window-or-workspace
        ;; :n "M-n" #'next-buffer
        ;; :n "M-p" #'previous-buffer
        ;; :n "M-z" #'+vterm/toggle
        ;; :n "M-e" #'+eshell/toggle
        ;; :n "M-o" #'hippie-expand
        ;; :desc "Hyperbole" "C-h h" #'hyperbole
        :leader
        ;; :desc "Hippie Expand" "e" #'hippie-expand
        :desc "Jump to register" "r" #'jump-to-register))

;; Quicker window management keybindings
;; (bind-key* "C-j" #'evil-window-down)
;; (bind-key* "C-k" #'evil-window-up)
;; (bind-key* "C-h" #'evil-window-left)
;; (bind-key* "C-l" #'evil-window-right)
(bind-key* "M-o" #'hippie-expand)
(bind-key* "C-q" #'evil-window-delete)
(bind-key* "M-q" #'kill-current-buffer)
(bind-key* "M-w" #'+workspace/close-window-or-workspace)
(bind-key* "M-n" #'next-buffer)
(bind-key* "M-p" #'previous-buffer)
(bind-key* "M-z" #'+vterm/toggle)
(bind-key* "M-e" #'+eshell/toggle)
;; (bind-key* (kbd "M-<return>") #'+vterm/here)
;; (bind-key* (kbd "M-E") #'+eshell/here)

;; (defun disable-cursor()
;;   (setq-local evil-normal-state-cursor '(bar . 0))
;;   (hl-line-mode -1)
;;   )
;; (add-hook 'dashboard-mode-hook 'disable-cursor)

;; Smooth scrolling
;; requires good-scroll.el
;; (good-scroll-mode 1)
;; (setq good-scroll-duration 0.4
;;      good-scroll-step 270
;;      good-scroll-render-rate 0.03)

;; (global-set-key (kbd "<next>") #'good-scroll-up-full-screen)
;; (global-set-key (kbd "<prior>") #'good-scroll-down-full-screen)

;; (setq scroll-margin 10)
;; (setq hscroll-margin 10)

;; Requires for faster loading
;; (require 'org-agenda)
;; (require 'dired)

;; Garbage collection to speed things up
(add-hook 'after-init-hook
          #'(lambda ()
              (setq gc-cons-threshold (* 100 1024 1024))))
(add-hook 'focus-out-hook 'garbage-collect)
(run-with-idle-timer 5 t 'garbage-collect)

;; Neotree fun
(defun neotree-snipe-dir ()
  (interactive)
  (if (projectile-project-root)
      (neotree-dir (projectile-project-root))
    (neotree-dir (file-name-directory (file-truename (buffer-name))))
    )
  )

(map! :leader :desc "Open neotree here" "o n" #'neotree-snipe-dir
      :desc "Hide neotree" "o N" #'neotree-hide)

;; For camelCase
(global-subword-mode 1)

;; ripgrep as grep
(setq grep-command "rg -nS --no-heading "
      grep-use-null-device nil)

;; Mini-frames ;; cool but kinda suboptimal atm
                                        ;(add-load-path! "~/.emacs.d/mini-frame")
;; (require 'mini-frame)
(setq mini-frame-ignore-commands '(evil-ex-search-forward helpful-variable helpful-callable))
(setq mini-frame-show-parameters
      '((left . 216)
        (top . 240)
        (width . 0.78)
        (height . 20)
        (alpha-background . 90))
      )
(setq mini-frame-detach-on-hide nil)
(setq mini-frame-resize t)
(setq resize-mini-frames t)
(setq mini-frame-standalone nil)
;; (mini-frame-mode 1)

;; Automatically show images but manually control their size
;; (setq org-startup-with-inline-images t
;;       org-image-actual-width nil)

;; (require 'evil-org)
;; (require 'evil-org-agenda)
;; (add-hook 'org-mode-hook 'evil-org-mode -100)

;; Top-level headings should be bigger!
(custom-set-faces!
  `(outline-1 :height 1.3 :foreground ,(nth 1 (nth 14 doom-themes--colors)))
  `(outline-2 :height 1.25 :foreground ,(nth 1 (nth 15 doom-themes--colors)))
  `(outline-3 :height 1.2 :foreground ,(nth 1 (nth 19 doom-themes--colors)))
  `(outline-4 :height 1.1 :foreground ,(nth 1 (nth 23 doom-themes--colors)))
  `(outline-5 :height 1.1 :foreground ,(nth 1 (nth 24 doom-themes--colors)))
  `(outline-6 :height 1.1 :foreground ,(nth 1 (nth 16 doom-themes--colors)))
  `(outline-7 :height 1.05 :foreground ,(nth 1 (nth 18 doom-themes--colors)))
  `(outline-8 :height 1.05 :foreground ,(nth 1 (nth 11 doom-themes--colors)))
  '(variable-pitch :family "JetBrainsMono")
  `(org-agenda-date :inherit 'unspecified :foreground ,(nth 1 (nth 19 doom-themes--colors)) :weight bold :height 1.1)
  `(org-agenda-date-today :inherit 'unspecified :foreground ,(nth 1 (nth 15 doom-themes--colors)) :weight bold :height 1.1)
  `(org-agenda-date-weekend :inherit 'unspecified :foreground ,(nth 1 (nth 24 doom-themes--colors)) :weight bold :height 1.1)
  `(org-agenda-date-weekend-today :inherit 'unspecified :foreground ,(nth 1 (nth 15 doom-themes--colors)) :weight bold :height 1.1)
  )

;; (after! org (org-eldoc-load))

;; (with-eval-after-load 'org (global-org-modern-mode))

;; Add frame borders and window dividers
;; (modify-all-frames-parameters
;;  '((right-divider-width . 5)
;;    (internal-border-width . 5)))
;; (dolist (face '(window-divider
;;                 window-divider-first-pixel
;;                 window-divider-last-pixel))
;;   (face-spec-reset-face face)
;;   (set-face-foreground face (face-attribute 'default :background)))
;; (set-face-background 'fringe (face-attribute 'default :background))


;; (setq
 ;; Edit settings
 ;; org-auto-align-tags nil
 ;; org-tags-column 0
 ;; org-special-ctrl-a/e t
 ;; org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
 ;; org-hide-emphasis-markers t
 ;; org-pretty-entities t
 ;; org-ellipsis "…")

;; (setq-default line-spacing 0)

;; Automatic table of contents is nice
;; (if (require 'toc-org nil t)
;;     (progn
;;       (add-hook 'org-mode-hook 'toc-org-mode)
;;       (add-hook 'markdown-mode-hook 'toc-org-mode))
;;   (warn "toc-org not found"))

;; Better for org source blocks
;; (setq electric-indent-mode nil)
;; (setq org-src-window-setup 'current-window)
;; (set-popup-rule! "^\\*Org Src"
;;   :side 'top'
;;   :size 0.9)


;; Horizontal scrolling tables
;; (add-load-path! "~/.emacs.d/phscroll")
;; (setq org-startup-truncated nil)
;; (with-eval-after-load "org"
;;   (require 'org-phscroll))
;; (setq phscroll-calculate-in-pixels t)

;; Org side tree outline
;; (add-load-path! "~/.emacs.d/org-side-tree")
;; (require 'org-side-tree)
;; (setq org-side-tree-persistent nil)
;; (setq org-side-tree-fontify t)
;; (setq org-side-tree-enable-folding t)
;; (defun org-side-tree-create-or-toggle ()
;;   (interactive)
;;   (if (or (org-side-tree-has-tree-p) (eq major-mode 'org-side-tree-mode))
;;       (org-side-tree-toggle)
;;       (org-side-tree)))
;; (map! :leader
;;       "O t" #'org-side-tree-create-or-toggle)
;; (map! :map org-side-tree-mode-map
;;       "SPC" nil)

;; (require 'org-download)
;; Drag-and-drop to `dired`
;; (add-hook 'dired-mode-hook 'org-download-enable)

;; system-wm-type, wayland or x11? only should be considered if system-nix-profile is "personal" or "work"
;; (if (string= system-wm-type "wayland")
;;   (setq org-download-screenshot-method "grim -g \"$(slurp)\" %s")
;;   (setq org-download-screenshot-method "flameshot gui -p %s")
;; )

;; (after! org-download
;;    (setq org-download-method 'directory))

;; (after! org
;;   (setq-default org-download-image-dir "img/"
;;         org-download-heading-lvl nil))

;; (add-to-list 'display-buffer-alist '("^*Async Shell Command*" . (display-buffer-no-window)))

;; (defun org-download-clipboard-basename ()
;;   (interactive)
;;   (setq org-download-path-last-dir org-download-image-dir)
;;   (setq org-download-image-dir (completing-read "directory: " (-filter #'f-directory-p (directory-files-recursively "." "" t)) nil t))
;;   (org-download-clipboard (completing-read "basename: " '() nil nil))
;;   (setq org-download-image-dir org-download-path-last-dir)
;; )

;; (map! :leader
;;       :desc "Insert a screenshot"
;;       "i s" 'org-download-screenshot
;;       :desc "Insert image from clipboard"
;;       "i p" 'org-download-clipboard
;;       "i P" 'org-download-clipboard-basename)

;; (defun org-new-file-from-template()
;;   "Copy a template from ~/Templates into a time stamped unique-named file in the
;; same directory as the org-buffer and insert a link to this file."
;;   (interactive)
;;   (setq template-file (completing-read "Template file:" (directory-files "~/Templates")))
;;   (setq filename
;;         (concat
;;          (make-temp-name
;;           (concat (file-name-directory (buffer-file-name))
;;                   "files/"
;;                   (file-name-nondirectory (buffer-file-name))
;;                   "_"
;;                   (format-time-string "%Y%m%d_%H%M%S_")) ) (file-name-extension template-file t)))
;;   (copy-file (concat user-home-directory "/Templates/" template-file) filename)
;;   (setq prettyname (read-from-minibuffer "Pretty name:"))
;;   (insert (concat "[[./files/" (file-name-nondirectory filename) "][" prettyname "]]"))
;;   (org-display-inline-images))

;; (map! :leader
;;       :desc "Create a new file from a template and insert a link at point"
;;       "i t" 'my-org-new-file-from-template)

;; (if (not (string= system-nix-profile "wsl"))
;;   (when (require 'openwith nil 'noerror)
;;      (setq openwith-associations
;;            (list
;;            (list (openwith-make-extension-regexp
;;                   '("mpg" "mpeg" "mp3" "mp4"
;;                     "avi" "wmv" "wav" "mov" "flv"
;;                     "ogm" "ogg" "mkv"))
;;                     "mpv"
;;                     '(file))
;;            (list (openwith-make-extension-regexp
;;                   '("doc" "xls" "ppt" "odt" "ods" "odg" "odp"))
;;                     "libreoffice"
;;                     '(file))
;;                '("\\.lyx" "lyx" (file))
;;                '("\\.chm" "kchmviewer" (file))
;;            (list (openwith-make-extension-regexp
;;                   '("pdf" "ps" "ps.gz" "dvi"))
;;                     "atril"
;;                     '(file))
;;            (list (openwith-make-extension-regexp
;;                   '("kdenlive"))
;;                     "kdenlive-accel"
;;                     '(file))
;;            (list (openwith-make-extension-regexp
;;                   '("kra"))
;;                     "krita"
;;                     '(file))
;;            (list (openwith-make-extension-regexp
;;                   '("blend" "blend1"))
;;                     "blender"
;;                     '(file))
;;            (list (openwith-make-extension-regexp
;;                   '("helio"))
;;                     "helio"
;;                     '(file))
;;            (list (openwith-make-extension-regexp
;;                   '("svg"))
;;                     "inkscape"
;;                     '(file))
;;            (list (openwith-make-extension-regexp
;;                   '("flp"))
;;                     "flstudio"
;;                     '(file))
;;            (list (openwith-make-extension-regexp
;;                   '("mid"))
;;                     "rosegarden"
;;                     '(file))
;;                ))
;;      (openwith-mode 1)))

;; (add-load-path! "~/.emacs.d/org-krita")
;; (require 'org-krita)
;; (add-hook 'org-mode-hook 'org-krita-mode)
;; (setq org-krita-extract-filename "preview.png")
;; (setq org-krita-scale 1)

;; (add-load-path! "~/.emacs.d/org-xournalpp")
;; (require 'org-xournalpp)
;; (add-hook 'org-mode-hook 'org-xournalpp-mode)
;; (setq org-xournalpp-template-getter
;;   '(closure
;;     (t)
;;     nil
;;     (file-truename "~/Templates/template.xopp") ; use my own template
;;   )
;; )

;; override width to static 250 for now
;; so I don't have massive images in org mode (scrolling not fun)
;; (defun org-xournalpp--create-image (link refresh)
;;   "Extract svg/png from given LINK and return image.

;; Regenerate the cached inline image, if REFRESH is true.

;; If the path from LINK does not exist, nil is returned."
;;   (let ((width 250)
;;         (xopp-path (f-expand (org-element-property :path link))))
;;     (when (f-exists? xopp-path)
;;         (if width
;;             (create-image (org-xournalpp--get-image xopp-path refresh)
;;                           org-xournalpp-image-type
;;                           nil
;;                           :width width)
;;           (create-image (org-xournalpp--get-image xopp-path refresh)
;;                         org-xournalpp-image-type
;;                         nil)))))

;; Online images inside of org mode is pretty cool
;; This snippit is from Tobias on Stack Exchange
;; https://emacs.stackexchange.com/questions/42281/org-mode-is-it-possible-to-display-online-images
;; (require 'org-yt)

;; (defun org-image-link (protocol link _description)
;;   "Interpret LINK as base64-encoded image data."
;;   (cl-assert (string-match "\\`img" protocol) nil
;;              "Expected protocol type starting with img")
;;   (let ((buf (url-retrieve-synchronously (concat (substring protocol 3) ":" link))))
;;     (cl-assert buf nil
;;                "Download of image \"%s\" failed." link)
;;     (with-current-buffer buf
;;       (goto-char (point-min))
;;       (re-search-forward "\r?\n\r?\n")
;;       (buffer-substring-no-properties (point) (point-max)))))

;; (org-link-set-parameters
;;  "imghttp"
;;  :image-data-fun #'org-image-link)

;; (org-link-set-parameters
;;  "imghttps"
;;  :image-data-fun #'org-image-link)

;; Mermaid diagrams
;; (setq ob-mermaid-cli-path "~/.nix-profile/bin/mmdc")

;;;-- projectile wrapper commands ;;;--
;; (require 'sudo-edit)
;; (setq sudo-edit-local-method "doas")

;; (map! :leader
;;       :desc "Open current file as root"
;;       "f U" #'sudo-edit-current-file)
;; (map! :leader
;;       :desc "Find a file and open as root"
;;       "f u" #'sudo-edit-find-file)

(require 'focus)

(map! :leader
      :prefix ("F" . "Focus mode")
      :desc "Toggle focus mode"
      "t" 'focus-mode

      :desc "Pin focused section"
      "p" 'focus-pin

      :desc "Unpin focused section"
      "u" 'focus-unpin)

;; (add-to-list 'focus-mode-to-thing '(org-mode . org-element))
;; (add-to-list 'focus-mode-to-thing '(python-mode . paragraph))
;; (add-to-list 'focus-mode-to-thing '(lisp-mode . paragraph))

;;(add-hook 'org-mode-hook #'focus-mode)

(lsp-treemacs-sync-mode 1)

(setq lsp-treemacs-deps-position-params
      '((side . right)
        (slot . 1)
        (window-width . 35)))

(setq lsp-treemacs-symbols-position-params
      '((side . right)
        (slot . 2)
        (window-width . 35)))

(map! :leader :desc "Open treemacs symbol outliner" "o s" #'lsp-treemacs-symbols
      :desc "Hide neotree" "o S" #'treemacs-quit)

;; (setq +format-on-save-enabled-modes '(not emacs-lisp-mode sql-mode tex-mode latex-mode org-msg-edit-mode nix-mode))

;; Enable autorevert globally so that buffers update when files change on disk.
;; Very useful when used with file syncing (i.e. syncthing)
(setq global-auto-revert-mode nil)
(setq auto-revert-use-notify t)

;; (use-package lsp-nix
;;   :ensure lsp-mode
;;   :after (lsp-mode)
;;   :demand t
;;   :custom
;;   (lsp-nix-nil-formatter ["nixpkgs-fmt"]))

(use-package! theme-magic
  :commands theme-magic-from-emacs
  :config
  (defadvice! theme-magic--auto-extract-16-doom-colors ()
    :override #'theme-magic--auto-extract-16-colors
    (list
     (face-attribute 'default :background)
     (doom-color 'error)
     (doom-color 'success)
     (doom-color 'type)
     (doom-color 'keywords)
     (doom-color 'constants)
     (doom-color 'functions)
     (face-attribute 'default :foreground)
     (face-attribute 'shadow :foreground)
     (doom-blend 'base8 'error 0.1)
     (doom-blend 'base8 'success 0.1)
     (doom-blend 'base8 'type 0.1)
     (doom-blend 'base8 'keywords 0.1)
     (doom-blend 'base8 'constants 0.1)
     (doom-blend 'base8 'functions 0.1)
     (face-attribute 'default :foreground))))

(after! org
  (setq org-directory "~/Org"                     ; let's put files here
        org-list-allow-alphabetical t             ; have a. A. a) A) list bullets
        org-use-property-inheritance t            ; it's convenient to have properties inherited
        org-fold-catch-invisible-edits 'smart          ; try not to accidently do weird stuff in invisible regions
        org-log-done 'time                        ; having the time a item is done sounds convenient
        org-roam-directory "~/Org/roam/"))        ; same thing, for roam

;; org-agenda-config
(after! org-agenda
  (setq org-agenda-files (list "~/org/agenda.org"
                               "~/org/todo.org"))
  (setq org-agenda-window-setup 'current-window
        org-agenda-restore-windows-after-quit t
        org-agenda-show-all-dates nil
        org-agenda-time-in-grid t
        org-agenda-show-current-time-in-grid t
        org-agenda-start-on-weekday 1
        org-agenda-span 7
        org-agenda-tags-column  0
        org-agenda-block-separator nil
        org-agenda-category-icon-alist nil
        org-agenda-sticky t)
  (setq org-agenda-prefix-format
        '((agenda . "%i %?-12t%s")
          (todo .   "%i")
          (tags .   "%i")
          (search . "%i")))
  (setq org-agenda-sorting-strategy
        '((agenda deadline-down scheduled-down todo-state-up time-up
                  habit-down priority-down category-keep)
          (todo   priority-down category-keep)
          (tags   timestamp-up priority-down category-keep)
          (search category-keep))))


(after! org
  (remove-hook 'org-agenda-finalize-hook '+org-exclude-agenda-buffers-from-workspace-h)
  (remove-hook 'org-agenda-finalize-hook
               '+org-defer-mode-in-agenda-buffers-h))

(after! org
  (setq org-agenda-deadline-faces
        '((1.0 . error)
          (1.0 . org-warning)
          (0.5 . org-upcoming-deadline)
          (0.0 . org-upcoming-distant-deadline))))

;; org modern
(setq ;; Edit settings
 org-auto-align-tags nil
 org-tags-column 0
 org-fold-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-ellipsis "…"

 ;; Agenda styling
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "⭠ now ─────────────────────────────────────────────────")
(global-org-modern-mode)


(use-package svg-tag-mode
  :commands svg-tag-mode
  :config
  (defconst date-re "[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}")
  (defconst time-re "[0-9]\\{2\\}:[0-9]\\{2\\}")
  (defconst day-re "[A-Za-z]\\{3\\}")
  (defconst day-time-re (format "\\(%s\\)? ?\\(%s\\)?" day-re time-re))
  (defun svg-progress-percent (value)
    (svg-image (svg-lib-concat
                (svg-lib-progress-bar (/ (string-to-number value) 100.0)
                                  nil :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
                (svg-lib-tag (concat value "%")
                             nil :stroke 0 :margin 0)) :ascent 'center))

  (defun svg-progress-count (value)
    (let* ((seq (mapcar #'string-to-number (split-string value "/")))
           (count (float (car seq)))
           (total (float (cadr seq))))
    (svg-image (svg-lib-concat
                (svg-lib-progress-bar (/ count total) nil
                                      :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
                (svg-lib-tag value nil
                             :stroke 0 :margin 0)) :ascent 'center)))

  (setq svg-tag-tags
        `(
          ;; Org tags
          (":\\([A-Za-z0-9]+\\)" . ((lambda (tag) (svg-tag-make tag))))
          (":\\([A-Za-z0-9]+[ \-]\\)" . ((lambda (tag) tag)))
          ;; Task priority
          ("\\[#[A-Z]\\]" . ( (lambda (tag)
                                (svg-tag-make tag :face 'org-priority
                                              :beg 2 :end -1 :margin 0))))

          ;; Progress
          ("\\(\\[[0-9]\\{1,3\\}%\\]\\)" . ((lambda (tag)
                                              (svg-progress-percent (substring tag 1 -2)))))
          ("\\(\\[[0-9]+/[0-9]+\\]\\)" . ((lambda (tag)
                                            (svg-progress-count (substring tag 1 -1)))))

          ;; TODO / DONE
          ("TODO" . ((lambda (tag) (svg-tag-make "TODO" :face 'org-todo :inverse t :margin 0))))
          ("DONE" . ((lambda (tag) (svg-tag-make "DONE" :face 'org-done :margin 0))))


          ;; Citation of the form [cite:@Knuth:1984]
          ("\\(\\[cite:@[A-Za-z]+:\\)" . ((lambda (tag)
                                            (svg-tag-make tag
                                                          :inverse t
                                                          :beg 7 :end -1
                                                          :crop-right t))))
          ("\\[cite:@[A-Za-z]+:\\([0-9]+\\]\\)" . ((lambda (tag)
                                                  (svg-tag-make tag
                                                                :end -1
                                                                :crop-left t))))


          ;; Active date (with or without day name, with or without time)
          (,(format "\\(<%s>\\)" date-re) .
           ((lambda (tag)
              (svg-tag-make tag :beg 1 :end -1 :margin 0))))
          (,(format "\\(<%s \\)%s>" date-re day-time-re) .
           ((lambda (tag)
              (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0))))
          (,(format "<%s \\(%s>\\)" date-re day-time-re) .
           ((lambda (tag)
              (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0))))

          ;; Inactive date  (with or without day name, with or without time)
           (,(format "\\(\\[%s\\]\\)" date-re) .
            ((lambda (tag)
               (svg-tag-make tag :beg 1 :end -1 :margin 0 :face 'org-date))))
           (,(format "\\(\\[%s \\)%s\\]" date-re day-time-re) .
            ((lambda (tag)
               (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0 :face 'org-date))))
           (,(format "\\[%s \\(%s\\]\\)" date-re day-time-re) .
            ((lambda (tag)
               (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0 :face 'org-date)))))))
