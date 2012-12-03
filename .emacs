; load color theme
; download color theme from here: http://download.savannah.gnu.org/releases/color-theme/
(add-to-list 'load-path "~/.emacs.d/nemoden/color-theme-6.6.0/")

; default files settings
(custom-set-variables
  '(org-agenda-files (quote ("~/Dropbox/org"))) ; search files for agenda in ~/Dropbox/org dir
  '(org-default-notes-file "~/Dropbox/org/notes.org") ; I've got no idea why I need this
  '(org-directory "~/Dropbox/org") ; org directory. Don't know why I need this eather
)

; install org mode
(require 'org-install)

; associate .org files with emacs org-mode
(add-to-list 'auto-mode-alist '("\\.org'".org-mode))

; org shortcuts
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

; navigate through header titles using Shift + Right or + Left 
; if holding cursor under the header
(setq org-todo-keywords
  '(
    (sequence "TODO(t!)" "PROC(p!)" "WAIT(w!)" "|" "DONE(d!)")
  )
)

; set keywords colors and fonts
(setq org-todo-keyword-faces
  '(
    ("TODO".(:foreground "red" :weight bold))
    ("WAIT".(:foreground "orange" :weight bold))
    ("PROC".(:foreground "yellow" :weight bold))
    ("DONE".(:foreground "green" :weight bold))
  )
)

; tags
(setq org-tag-alist '(("work" . ?w) ("home" . ?h) ("tobuy" . ?b) ("toread" . ?r)))

; we just need this. nobody knows why
(global-font-lock-mode 1)

; hmmm. ok
; (require 'mercurial)

; color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)

; access org file using M-x myorg
(defun myorg()
  (interactive)
  (find-file "~/Dropbox/org/default.org")
)

; access links file using M-x mylinks
(defun mylinks()
  (interactive)
  (find-file "~/Dropbox/org/links.org")
)

; access notes file using M-x mynotes
(defun mynotes()
  (interactive)
  (find-file "~/Dropbox/org/notes.org")
)

; quotes
(defun myquotes()
  (interactive)
  (find-file "~/Dropbox/org/quotes.org")
)

; ideas
(defun myideas()
  (interactive)
  (find-file "~/Dropbox/org/ideas.org")
)
