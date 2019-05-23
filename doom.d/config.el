;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq doom-font (font-spec :family "FuraCode Nerd Font Mono" :size 11))

;; Enable Line Numbers (relative)
(setq display-line-numbers-type 'relative)

;; Org mode agenda files
(after! org
  (setq org-agenda-files (list "~/org/todo.org" "~/org/notes.org")))
