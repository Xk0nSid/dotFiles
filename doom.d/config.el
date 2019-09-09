;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq doom-font (font-spec :family "Fire Code iScript" :size 11))

;; Enable Line Numbers (relative)
(setq display-line-numbers-type 'relative)

;; Modeline
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-buffer-modification-icon t)

; Display
(setq doom-modeline-lsp t)

; Environment details
(setq doom-modeline-env-enable-python t)
(setq doom-modeline-env-enable-go t)
(setq doom-modeline-env-enable-rust t)

; Projectile configuration
(setq projectile-project-search-path '("~/workspace/goprojects" "~/workspace/rust-lang" "~/workspace/python"))

(after! deft
  (global-set-key [f8] 'deft)
  (setq deft-recursive t)
  (setq deft-extensions '("txt" "tex" "org" "md"))
  (setq deft-directory "~/workspace/notes"))

;; Org mode agenda files
(after! org
  (setq org-agenda-files (list "~/workspace/notes/org/todo.org" "~/workspace/notes/org/notes.org")))

(after! rust-mode
  (setq rust-format-on-save t))

;; Golang

(after! go-mode
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save))

