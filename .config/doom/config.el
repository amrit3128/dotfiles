
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")
(setq user-full-name "Amritanshu"
      user-mail-address "tripathyamritanshu7@gmail.com")

(set-face-attribute 'default nil :family "JetBrainsMono Nerd Font" :height 130)

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
(setq doom-theme 'doom-monokai-ristretto)

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
(set-face-attribute 'default nil :height 120)


(add-to-list 'default-frame-alist '(alpha-background . 90))


(setq
 confirm-kill-emacs nil
 undo-tree-mode 1
 treemacs-is-never-other-window nil
 display-line-numbers 'relative
 projectile-globally-ignored-directories '("env" ".git" "venv" ".venv")
 ;; projectile-project-search-path '("~/git_repos/" "~/codes/"))
 projectile-project-search-path '("~/codes/"))

;; Dashboard
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)

(defun my-weebery-is-always-greater ()
  (let* ((banner '(
                   "███████╗███╗   ███╗ █████╗  ██████╗███████╗"
                   "██╔════╝████╗ ████║██╔══██╗██╔════╝██╔════╝"
                   "█████╗  ██╔████╔██║███████║██║     ███████╗"
                   "██╔══╝  ██║╚██╔╝██║██╔══██║██║     ╚════██║"
                   "███████╗██║ ╚═╝ ██║██║  ██║╚██████╗███████║"
                   "╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝"
                   "         the editor that god uses          "
                   ))
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


;; Garbage collection to speed things up
(add-hook 'after-init-hook
          #'(lambda ()
              (setq gc-cons-threshold (* 100 1024 1024))))
(add-hook 'focus-out-hook 'garbage-collect)
(run-with-idle-timer 5 t 'garbage-collect)

;; For camelCase
(global-subword-mode 1)

;; ripgrep as grep
(setq grep-command "rg -nS --no-heading "
      grep-use-null-device nil)

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


(require 'focus)

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

;; Enable autorevert globally so that buffers update when files change on disk.
;; Very useful when used with file syncing (i.e. syncthing)
(setq global-auto-revert-mode nil)
(setq auto-revert-use-notify t)


(use-package! drag-stuff
  :defer t
  :init
  (map! "<M-up>"    #'drag-stuff-up
        "<M-down>"  #'drag-stuff-down
        "<M-left>"  #'drag-stuff-left
        "<M-right>" #'drag-stuff-right))

(setq deft-directory "~/notes/"
      deft-extensions '("org" "txt" "md" "tex")
      deft-recursive t)

(setq org-directory "~/notes/")

(require 'org)
(require 'org-element)

(defcustom org-yt-url-protocol "yt"
  "Protocol identifier for youtube links."
  :group 'org-yt
  :type 'string)

(defun org-yt-follow (video-id)
  "Open youtube with VIDEO-ID."
  (browse-url (concat "https://youtu.be/" video-id)))

(org-link-set-parameters org-yt-url-protocol :follow #'org-yt-follow)

(defun org-image-update-overlay (file link &optional data-p refresh)
  "Create image overlay for FILE associtated with org-element LINK.
        If DATA-P is non-nil FILE is not a file name but a string with the image data.
        See also `create-image'.
        This function is almost a duplicate of a part of `org-display-inline-images'."
  (when (or data-p (file-exists-p file))
    (let ((width
           ;; Apply `org-image-actual-width' specifications.
           (cond
            ((not (image-type-available-p 'imagemagick)) nil)
            ((eq org-image-actual-width t) nil)
            ((listp org-image-actual-width)
             (or
              ;; First try to find a width among
              ;; attributes associated to the paragraph
              ;; containing link.
              (let ((paragraph
                     (let ((e link))
                       (while (and (setq e (org-element-property
                                            :parent e))
                                   (not (eq (org-element-type e)
                                            'paragraph))))
                       e)))
                (when paragraph
                  (save-excursion
                    (goto-char (org-element-property :begin paragraph))
                    (when
                        (re-search-forward
                         "^[ \t]*#\\+attr_.*?: +.*?:width +\\(\\S-+\\)"
                         (org-element-property
                          :post-affiliated paragraph)
                         t)
                      (string-to-number (match-string 1))))))
              ;; Otherwise, fall-back to provided number.
              (car org-image-actual-width)))
            ((numberp org-image-actual-width)
             org-image-actual-width)))
          (old (get-char-property-and-overlay
                (org-element-property :begin link)
                'org-image-overlay))
          )
      (if (and (car-safe old) refresh)
          (image-refresh (overlay-get (cdr old) 'display))
        ;; (image-flush (overlay-get (cdr old) 'display))
        (let ((image (create-image file
                                   (and width 'imagemagick)
                                   data-p
                                   :width width)))
          (when image
            (let* ((link
                    ;; If inline image is the description
                    ;; of another link, be sure to
                    ;; consider the latter as the one to
                    ;; apply the overlay on.
                    (let ((parent
                           (org-element-property :parent link)))
                      (if (eq (org-element-type parent) 'link)
                          parent
                        link)))
                   (ov (make-overlay
                        (org-element-property :begin link)
                        (progn
                          (goto-char
                           (org-element-property :end link))
                          (skip-chars-backward " \t")
                          (point)))))
              (overlay-put ov 'display image)
              (overlay-put ov 'face 'default)
              (overlay-put ov 'org-image-overlay t)
              (overlay-put
               ov 'modification-hooks
               (list 'org-display-inline-remove-overlay))
              (push ov org-inline-image-overlays))))))))

(defun org-yt-get-image (url)
  "Retrieve image from url."
  (let ((image-buf (url-retrieve-synchronously url)))
    (when image-buf
      (with-current-buffer image-buf
        (goto-char (point-min))
        (when (looking-at "HTTP/")
          (delete-region (point-min)
                         (progn (re-search-forward "\n[\n]+")
                                (point))))
        (setq image-data (buffer-substring-no-properties (point-min) (point-max)))))))

(defconst org-yt-video-id-regexp "[-_[:alnum:]]\\{10\\}[AEIMQUYcgkosw048]"
  "Regexp matching youtube video id's taken from `https://webapps.stackexchange.com/questions/54443/format-for-id-of-youtube-video'.")

(defun org-yt-display-inline-images (&optional include-linked refresh beg end)
  "Like `org-display-inline-images' but for yt-links."
  (when (display-graphic-p)
    (org-with-wide-buffer
     (goto-char (or beg (point-min)))
     (let ((re (format "\\[\\[%s:\\(%s\\)\\]\\]" org-yt-url-protocol org-yt-video-id-regexp)))
       (while (re-search-forward re end t)
         (let ((video-id (match-string 1))
               (el (save-excursion (goto-char (match-beginning 1)) (org-element-context)))
               image-data)
           (when el
             (setq image-data
                   (or (let ((old (get-char-property-and-overlay

                                   'org-image-overlay)))
                         (and old
                              (car-safe old)
                              (overlay-get (cdr old) 'display)))
                       (org-yt-get-image (format "http://img.youtube.com/vi/%s/0.jpg" video-id))))
             (when image-data
               (org-image-update-overlay image-data el t t)))))))))

(advice-add #'org-display-inline-images :after #'org-yt-display-inline-images)

(use-package vertico
  ;; :ensure t
  ;; :hook
  ;; :custom
  ;; (vertico-count 10)                    ;; Number of candidates to display in the completion list.
  ;; (vertico-resize nil)                  ;; Disable resizing of the vertico minibuffer.
  ;; (vertico-cycle nil)                   ;; Do not cycle through candidates when reaching the end of the list.
  :config
  ;; Customize the display of the current candidate in the completion list.
  ;; This will prefix the current candidate with “» ” to make it stand out.
  ;; Reference: https://github.com/minad/vertico/wiki#prefix-current-candidate-with-arrow
  (advice-add #'vertico--format-candidate :around
              (lambda (orig cand prefix suffix index _start)
                (setq cand (funcall orig cand prefix suffix index _start))
                (concat
                 (if (= vertico--index index)
                     (propertize "» " 'face '(:foreground "#80adf0" :weight bold))
                   "  ")
                 cand))))

(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (cmake "https://github.com/uyha/tree-sitter-cmake")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (make "https://github.com/alemuller/tree-sitter-make")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")
        (hyprlang "https://github.com/tree-sitter-grammars/tree-sitter-hyprlang")))


(defun lsp-booster--advice-json-parse (old-fn &rest args)
  "Try to parse bytecode instead of json."
  (or
   (when (equal (following-char) ?#)
     (let ((bytecode (read (current-buffer))))
       (when (byte-code-function-p bytecode)
         (funcall bytecode))))
   (apply old-fn args)))
(advice-add (if (progn (require 'json)
                       (fboundp 'json-parse-buffer))
                'json-parse-buffer
              'json-read)
            :around
            #'lsp-booster--advice-json-parse)

(defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
  "Prepend emacs-lsp-booster command to lsp CMD."
  (let ((orig-result (funcall old-fn cmd test?)))
    (if (and (not test?)                             ;; for check lsp-server-present?
             (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
             lsp-use-plists
             (not (functionp 'json-rpc-connection))  ;; native json-rpc
             (executable-find "emacs-lsp-booster"))
        (progn
          (when-let ((command-from-exec-path (executable-find (car orig-result))))  ;; resolve command from exec-path (in case not found in $PATH)
            (setcar orig-result command-from-exec-path))
          (message "Using emacs-lsp-booster for %s!" orig-result)
          (cons "emacs-lsp-booster" orig-result))
      orig-result)))
(advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)

;; Use a custom browser command
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "/usr/bin/zen-browser")
