(use-package mu4e
  :ensure nil
  :config
  (setq mu4e-change-filenames-when-moving t)

  ;; Refresh mail using isync every 10 minutes
  (setq mu4e-maildir "~/Maildir")
