;; start in fullscreen
(toggle-frame-fullscreen)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; install use-package if not present
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

;; ensure all packages
(require 'use-package)
(setq use-package-always-ensure t)

;; set the theme
(use-package underwater-theme)
(load-theme 'underwater t)

;; highlight current line
(global-hl-line-mode 1)
(set-face-underline 'hl-line nil)

;; don't show the splash screen
(setq inhibit-startup-message t)

;; move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; disable tool bar, scroll bar and menu bar
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; enable line numbers and column number
(column-number-mode)
(global-display-line-numbers-mode 1)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
		shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; set font 
(set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 200)  

;; remember recently edited files
(recentf-mode 1)

;; save minibuffers history
(savehist-mode 1)

;; save last visited location of each file
(save-place-mode 1)

;; refresh buffers when the file on disk has changed
(global-auto-revert-mode 1)

;; same thing but for dired
(setq global-auto-revert-non-file-buffers t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; ivy completion framework
(use-package ivy)
  :init(ivy-mode 1)

;; allow rainbow delimiters in all programming languages mode
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; helper package that suggest you keybindings
(use-package which-key
  :init (which-key-mode 1)
  :config
  (setq which-key-idle-delay 0.3))

;; dependency for ivy-rich
(use-package counsel
  :bind(("M-x" . counsel-M-x)
	("C-x b" . counsel-ibuffer)
	("C-x C-f" . counsel-find-file)
	:map minibuffer-local-map
	("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; don't start searches with ^

;; ivy-rich adds at a glance information for functions when you press M-x
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; let's go evil

;; in some buffers, start in emacs-mode (no evil keybindings)
(defun rune/evil-hook ()
  (dolist (mode '(custom-mode
                  eshell-mode
		  shell-mode
                  term-mode))
   (add-to-list 'evil-emacs-state-modes mode)))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (evil-mode 1)
  :hook (evil-mode . rune/evil-hook)
  :config
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  ;; the next line sets c+h to delete backward, can be useful to not move fingers from home row
  ;; however can also be annoying if you press C-h to get the help
  ;;(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  ;; in some buffers, start in normal mode
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; too hardcore for now
;;(defun rune/dont-arrow-me-bro ()
;;  (interactive)
;;  (message "Arrow keys are bad, you know?"))

  ;; Disable arrow keys in normal and visual modes
;;  (define-key evil-normal-state-map (kbd "<left>") 'rune/dont-arrow-me-bro)
;;  (define-key evil-normal-state-map (kbd "<right>") 'rune/dont-arrow-me-bro)
;;  (define-key evil-normal-state-map (kbd "<down>") 'rune/dont-arrow-me-bro)
;;  (define-key evil-normal-state-map (kbd "<up>") 'rune/dont-arrow-me-bro)
;;  (evil-global-set-key 'motion (kbd "<left>") 'rune/dont-arrow-me-bro)
;;  (evil-global-set-key 'motion (kbd "<right>") 'rune/dont-arrow-me-bro)
;;  (evil-global-set-key 'motion (kbd "<down>") 'rune/dont-arrow-me-bro)
;;  (evil-global-set-key 'motion (kbd "<up>") 'rune/dont-arrow-me-bro)

;; hydra shortcut to change font size
(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

;; Org Mode Configuration ------------------------------------------------------

(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1))))
    ;;(set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  ;;(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  ;;(set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  ;;(set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  ;;(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  ;;(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  ;;(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  ;;(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))
  )

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (efs/org-font-setup))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

;; org-roam config

(use-package org-roam
  :custom
  (org-roam-directory "~/cryptomator_mnts/zettelkasten")
  ;;(org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
     ;("l" "programming language" plain
     ; "* Characteristics\n\n- Family: %?\n- Inspired by: \n\n* Reference:\n\n"
     ; :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
     ;:unnarrowed t)
   ))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
	 ;;:map org-mode-map
         ;;("C-M-i" . completion-at-point)
	 )
  :config
  (org-roam-setup))

;; org-roam-ui
(use-package org-roam-ui
    :after org-roam
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
    :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

