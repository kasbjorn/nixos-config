(use-package mu4e
  :ensure t
  :config
  (setq mu4e-change-filenames-when-moving t)
  (setq mu4e-maildir "~/Maildir")
  (setq mu4e-get-mail-command "mbsync -a")
  (setq user-full-name "Knut Asbjornsen"
	user-mail-address "kasbjornsen@frostbyte.works")

  (setq mu4e-drafts-folder "/[frostbyte]/Drafts")
  (setq mu4e-sent-folder   "/[frostbyte]/Sent Mail")
  (setq mu4e-refile-folder "/[frostbyte]/All Mail")
  (setq mu4e-trash-folder  "/[frostbyte]/Trash")

  (setq mu4e-maildir-shortcuts
    '((:maildir "/Inbox"    :key ?i)
      (:maildir "/[frostbyte]/Sent Mail" :key ?s)
      (:maildir "/[frostbyte]/Trash"     :key ?t)
      (:maildir "/[frostbyte]/Drafts"    :key ?d)
      (:maildir "/[frostbyte]/All Mail"  :key ?a))))

  (setq smtpmail-smtp-server "smtp.ionos.com"
      smtpmail-smtp-service 465
      smtpmail-stream-type  'ssl)

  (setq message-send-mail-function 'smtpmail-send-it)
  :init
  (mu4e t))
