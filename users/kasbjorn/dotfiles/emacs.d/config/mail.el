(use-package mu4e
  :ensure nil
  :config
  (setq mu4e-change-filenames-when-moving t)
  (setq mu4e-maildir "~/Maildir")
  (setq mu4e-get-mail-command "mbsync -a")
  (setq user-full-name "Knut Asbjornsen"
	user-mail-address "kasbjornsen@frostbyte.works")

  (setq mu4e-drafts-folder "/frostbyte/Drafts")
  (setq mu4e-sent-folder   "/frostbyte/Sent")
  (setq mu4e-refile-folder "/frostbyte/All Mail")
  (setq mu4e-trash-folder  "/frostbyte/Trash")

  (setq smtpmail-smtp-server "smtppro.zoho.com"
      smtpmail-smtp-service 465
      smtpmail-stream-type  'ssl)

  (setq message-send-mail-function 'smtpmail-send-it)
  :init
  (mu4e t))
