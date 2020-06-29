;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Chris Montgomery"
      user-mail-address "chris@montchr.io")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "JetBrains Mono" :size 15))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-pro)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; Point org-roam and deft to the `org' directory.
(setq org-roam-directory "~/org")
(setq deft-directory "~/org")

;; Configure org-journal for compatability with org-roam-dailies-today
(use-package org-journal
  :bind
  ("C-c n j" . org-journal-new-entry)
  :custom
  (org-journal-date-prefix "#+TITLE: ")
  (org-journal-file-format "%Y-%m-%d.org")
  (org-journal-dir "~/org")
  (org-journal-date-format "%A, %d %B %Y"))
(setq org-journal-enable-agenda-integration t)

;; Load and configure auto-dark-emacs
(use-package! auto-dark-emacs
  :custom
  (auto-dark-emacs/dark-theme 'doom-monokai-pro)
  (auto-dark-emacs/light-theme 'doom-one-light))


;; Simple settings.
;; https://tecosaur.github.io/emacs-config/config.html#simple-settings
(setq undo-limit 80000000
      evil-want-fine-undo t
      truncate-string-ellipsis "…")

;; Autosave
(setq auto-save-default t)
(add-hook 'auto-save-hook 'org-save-all-org-buffers)

;; Add prompt to select buffer upon opening new window
;; https://tecosaur.github.io/emacs-config/config.html#windows
(setq evil-vsplit-window-right t
      evil-split-window-below t)

;; Show previews in ivy.
(setq +ivy-buffer-preview t)
