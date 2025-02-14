(delete 'mu4e evil-collection-mode-list)
(delete 'mu4e-conversation evil-collection-mode-list)

(use-package mu4e
  :ensure nil
  ;; :load-path "/usr/share/emacs/site-lisp/mu4e/"
  ;; :defer 20 ; Wait until 20 seconds after startup
  :config

  ;; This is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; Refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-maildir "~/Mail")

  (setq mu4e-drafts-folder "/[Team]/Drafts")
  (setq mu4e-sent-folder   "/[Team]/Sent Mail")
  (setq mu4e-refile-folder "/[Team]/All Mail")
  (setq mu4e-trash-folder  "/[Team]/Trash")

  (setq mu4e-maildir-shortcuts
      '(("/Inbox"             . ?i)
        ("/[Team]/Sent Mail" . ?s)
        ("/[Team]/Trash"     . ?t)
        ("/[Team]/Drafts"    . ?d)
        ("/[Team]/All Mail"  . ?a))))
