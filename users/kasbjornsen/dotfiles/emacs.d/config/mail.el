(use-package mu4e
  :ensure t
  :config

  (setq mu4e-change-filenames-when-moving t)
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-maildir "~/Maildir")
  (setq mu4e-compose-context-policy 'ask-if-none)
  (setq mu4e-compose-format-flowed t)  
  
  (setq mu4e-contexts
	(list
	 (make-mu4e-context
	  :name "PraetorTEL"
	  :match-func
	  (lambda (msg)
	    (when msg
	      (string-prefix-p "/PraetorTEL" (mu4e-message-field msg :maildir))))
	  :vars
	  '((user-mail-address . "kasbjornsen@praetor.tel")
	    (user-full-name . "Knut Asbjornsen")
	    (smtpmail-smtp-server . "127.0.0.1")
	    (smtpmail-smtp-server . 1025)
	    (smtpmail-stream-type . 'starttls)
	    (send-mail-function . 'smtp-mail-sendit)
	    (mu4e-drafts-folder . "/[PraetorTEL]/Drafts")
	    (mu4e-sent-folder . "/[PraetorTEL]/Sent")
	    (mu4e-refile-folder . "/[PraetorTEL/All Mail")
	    (mu4e-trash-folder . "/[PraetorTEL/Trash")))))
  
  (setq mu4e-maildir-shortcuts
    '((:maildir "/Inbox"    :key ?i)
      (:maildir "/[PraetorTEL]/Sent Mail" :key ?s)
      (:maildir "/[PraetorTEL]/Trash"     :key ?t)
      (:maildir "/[PraetorTEL]/Drafts"    :key ?d)
      (:maildir "/[PraetorTEL]/All Mail"  :key ?a)))
  :init
  (mu4e t))
