(use-package mu4e
  :ensure nil
  :config
  (setq mu4e-change-filenames-when-moving t)
  (setq mu4e-maildir "~/Mail")
  (setq mu4e-get-mail-command "mbsync -a")
  (setq user-full-name "kasbjornsen@frostbyte.works"
	user-mail-address "kasbjornsen@frostbyte.works")
  :init
  (mu4e t))
