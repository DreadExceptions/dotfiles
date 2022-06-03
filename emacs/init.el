;; don't show the splash screen
(setq inhibit-startup-message t)

;; move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; disable tool bar, scroll bar and menu bar
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
	 
;; flash instead of beep beep
(setq visible-bell t)

;; enable line numbers
(global-display-line-numbers-mode 1)

;; set the theme
(load-theme 'modus-vivendi t)

;; set font 
(set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 200)  

;; highlight current line
(hl-line-mode 1)

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

(use-package ivy
    :bind (("C-s" . swiper)
          :map ivy-minibuffer-map
          ("TAB" . ivy-alt-done)	
          ("C-l" . ivy-alt-done)
          ("C-n" . ivy-next-line)
          ("C-p" . ivy-previous-line)
          :map ivy-switch-buffer-map
          ("C-p" . ivy-previous-line)
          ("C-l" . ivy-done)
          ("C-d" . ivy-switch-buffer-kill)
          :map ivy-reverse-i-search-map
          ("C-p" . ivy-previous-line)
          ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 10)))
