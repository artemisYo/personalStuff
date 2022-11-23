(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
inux, ensure you have the following dependencies satisfi      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
  (straight-use-package 'use-package)
  (setq straight-use-package-by-default t)

(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 75)
(global-display-line-numbers-mode t)
;disable line numbers in certain modes
(dolist (mode '(org-mode-hook
	term-mode-hook
	eshell-mode-hook))
(add-hook mode (lambda () (display-line-numbers-mode 0))))

(add-to-list 'default-frame-alist '(font ."Iosevka Nerd Font-18"))

(straight-use-package '(nano-modeline))
(nano-modeline-mode)

;; (use-package autothemer :ensure t)

  ;; (straight-use-package
  ;;   '(rose-pine-emacs
  ;;     :host github
  ;;     :repo "thongpv87/rose-pine-emacs"
  ;;     :branch "master"))
  ;; (load-theme 'rose-pine-dawn t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/everforest-theme")
(load-theme 'everforest-hard-dark t)

(use-package counsel
  :init (counsel-mode 1))

(use-package ivy
  :diminish
  :init (ivy-mode 1)
  :bind (("C-s" . swiper)
    :map ivy-minibuffer-map
       ("TAB" . ivy-alt-done)
       ("C-l" . ivy-alt-done)
       ("C-j" . ivy-next-line)
       ("C-k" . ivy-previous-line)
    :map ivy-switch-buffer-map
       ("C-k" . ivy-previous-line)
       ("C-l" . ivy-done)
       ("C-d" . ivy-switch-buffer-kill)
    :map ivy-reverse-i-search-map
       ("C-k" . ivy-previous-line)
       ("C-d" . ivy-reverse-i-search-kill)))
(use-package ivy-rich
  :init
    (ivy-rich-mode 1))

(use-package rust-mode
  :defer t)

(use-package markdown-mode
  :defer t)

(use-package erlang
  :defer t)

(use-package evil)
(evil-mode)
;escape to quit
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;Ctrl+Tab to open buffer switcher
(global-set-key (kbd "C-<tab>") 'counsel-switch-buffer)
(use-package which-key
  :config
    (which-key-mode)
    (setq which-key-idle-delay 1))

(use-package elcord)
(elcord-mode)

(use-package rainbow-delimiters
  :defer t)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(use-package yafolding)
(add-hook 'prog-mode-hook #'yafolding-mode)

(use-package focus)
(add-to-list 'focus-mode-to-thing '(text-mode . paragraph))

(use-package ligature
  :load-path "path-to-ligature-repo"
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\\\" "://" "+="))
  
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(use-package emacs-everywhere)

(use-package multiple-cursors)

(use-package vterm :defer t)

;  (require 'org)
    ;  (setq org-ellipsis " ▾"
    ;	org-hide-emphasis-markers nil)
    ;  (setq org-image-actual-width (list 350))
    ;  (setq org-format-latex-options (plist-put org-format-latex-options
    ;					   :scale 2.0))
(use-package org-modern
  :defer t)
(add-hook 'org-mode-hook 'org-modern-mode)

(defun org-font-setup ()
    ;; Replace list hyphen with dot
;    (font-lock-add-keywords 'org-mode
;                            '(("^ *\\([-]\\) "
;                               (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

    ;; Set faces for heading levels
;    (dolist (face '((org-level-1 . 1.2)
;                    (org-level-2 . 1.1)
;                    (org-level-3 . 1.05)
;                    (org-level-4 . 1.0)
;                    (org-level-5 . 1.1)
;                    (org-level-6 . 1.1)
;                    (org-level-7 . 1.1)
;                    (org-level-8 . 1.1)))
;      (set-face-attribute (car face) nil :font "Vollkorn" :weight 'bold :height (cdr face)))

    ;; Ensure that anything that should be fixed-pitch in Org files appears that way
    (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
    (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
    (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
    (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
    (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
    (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
    (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
    (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
    (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
    (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))
    (add-hook 'org-mode-hook #'org-font-setup)

    (defun org-mode-setup ()
    (org-indent-mode)
    (variable-pitch-mode 1)
    (visual-line-mode 1)
    (set-face-attribute 'variable-pitch nil :font "Gentium Book Basic"))
    (add-hook 'org-mode-hook #'org-mode-setup)

;(use-package org-bullets
;:defer t
;:hook (org-mode . org-bullets-mode)
;:custom
;(org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(push "~/.emacs.d/gits/org-fragtog" load-path)
(require 'org-fragtog)
(add-hook 'org-mode-hook 'org-fragtog-mode)

(defun vsc/center-view ()
  (setq visual-fill-column-width 70
      visual-fill-column-center-text t)
  (visual-fill-column-mode 1))
(use-package visual-fill-column
:hook (org-mode . vsc/center-view))

(define-key org-mode-map (kbd "<tab>") 'org-cycle)

(setq org-babel-default-header-args '((:tangle . "yes")))
(use-package org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode))

(with-eval-after-load 'org
  ;; This is needed as of Org 9.2
  (require 'org-tempo)

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp")))

(use-package gnuplot
  :defer t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(warning-suppress-types '((emacs) (emacs) (org-roam))))
 (custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
'(italic ((t (:slant italic :font "Latin Modern Roman")))))
