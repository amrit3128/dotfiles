;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;; (package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;; (package! another-package
;;   :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;; (package! this-package
;;   :recipe (:host github :repo "username/repo"
;;            :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;; (package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;; (package! builtin-package :recipe (:nonrecursive t))
;; (package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;; (package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;; (package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;; (unpin! pinned-package)
;; ...or multiple packages
;; (unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;; (unpin! t)

;; Themes
(package! ayu-theme)
(package! catppuccin-theme)
(package! abyss-theme)
(package! cyberpunk-theme)
(package! material-theme)

;; Packages
(package! org-modern)
(package! org-download)
(package! openwith)
(package! ob-mermaid)
(package! org-roam)
(package! org-transclusion)
;; (package! ess)
;; (package! elpy)
;; (package! python-cell)
(package! jupyter)
(package! tree-sitter)
(package! tree-sitter-langs)
(package! treesit-auto)
(package! lsp-pyright)
(package! ripgrep)
(package! rg)
(package! org-fancy-priorities)
(package! org-brain)
(package! org-super-agenda)
;; (package! vertico-posframe)
(package! spacious-padding)
;; (package! undo-tree)
(package! slime)
(package! zoxide)
(package! fzf)
(package! imenu-list)
(package! beacon)
(package! emmet-mode)
(package! web-mode)
(package! good-scroll)
;; (package! mini-frame)
(package! focus)
(package! direnv)
(package! vimrc-mode)
(package! lsp-treemacs)
(package! lsp-ui)
(package! kind-icon)
(package! sudo-edit)
(package! command-log-mode)
(package! md4rd)
(package! org-tree-slide)
(package! olivetti)
(package! drag-stuff)
;; (package! hyperbole)
(package! org-present)
;; (package! peep-dired)
(package! try)
;; (package! quickrun)
;; (package! multifiles)
;; (package! crux)
(package! mmm-mode)
(package! nov)
(package! spatial-navigate)
;; (package! gptel)

;; (when (package! lsp-bridge
;;         :recipe (:host github
;;                  :repo "manateelazycat/lsp-bridge"
;;                  :branch "master"
;;                  :files ("*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
;;                  ;; do not perform byte compilation or native compilation for lsp-bridge
;;                  :build (:not compile)))
;;   (package! markdown-mode)
;;   (package! yasnippet))

;; (package! hyprlang-ts-mode
;;   :recipe (:host github :repo "Nathan-Melaku/hyprlang-ts-mode"))
