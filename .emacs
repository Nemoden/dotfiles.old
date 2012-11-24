; all settings are inherited and adopted from this habr post:
; @link http://habrahabr.ru/post/28098/

; default files settings
(custom-set-variables
  '(org-agenda-files (quote ("~/Dropbox/agenda.org")))
  '(org-default-notes-file "~/Dropbox/notes.org")
  '(org-directory "~/Dropbox/org")
)

(require 'org-install)

; treat .org files as org-mode files
(add-to-list 'auto-mode-alist '("\\.org\\".org-mode))

; org shortcuts
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

; navigate through header titles using Shift + Right or + Left 
; if holding cursor under the header
(setq org-todo-keywords
  '(
    (sequence "TODO" "WAIT" "|" "DONE")
    (sequence "ANLZ" "FDEV" "CTST" "RDEV" "UTST" "|" "CNCL" "TRNS")
  )
)

; set keywords colors and fonts
(setq org-todo-keyword-faces
  '(
    ("TODO".(:foreground "red" :weight bold))
    ("WAIT".(:foreground "orange" :weight bold))
    ("DONE".(:foreground "green" :weight bold))
  )
)

; we just need this. nobody knows why
(global-font-lock-mode 1)

; hmmm. ok
; (require 'mercurial)

; color theme
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-charcoal-black)

; access org file using M-x myorg
(defun myorg()
  (interactive)
  (find-file "~/Dropbox/org/default.org")
)