(use-package mu4e
  :ensure t
  :config
  (setq mu4e-change-filenames-when-moving t)
  (setq mu4e-maildir "Mail")
  (setq mu4e-get-mail-command "mbsync -a")
  (setq user-full-name "Knut Asbjornsen"
	user-mail-address "kasbjornsen@frostbyte.works")

  (setq mu4e-drafts-folder "/Drafts")
  (setq mu4e-sent-folder   "/Sent")
  (setq mu4e-refile-folder "/All Mail")
  (setq mu4e-trash-folder  "/Trash")

  (setq smtpmail-smtp-server "smtp.ionos.com"
      smtpmail-smtp-service 465
      smtpmail-stream-type  'ssl)

  (setq message-send-mail-function 'smtpmail-send-it)
  :init
  (mu4e t))
