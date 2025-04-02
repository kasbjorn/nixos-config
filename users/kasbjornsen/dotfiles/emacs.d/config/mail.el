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
	      (string-prefix-p "/praetortel" (mu4e-message-field msg :maildir))))
	  :vars
	  '((user-mail-address . "kasbjornsen@praetor.tel")
	    (user-full-name . "Knut Asbjornsen")
	    (smtpmail-smtp-user . "kasbjornsen@praetor.tel")
	    (smtpmail-smtp-server  . "127.0.0.1")
            (smtpmail-smtp-service . 1025)
            (smtpmail-stream-type  . starttls)
	    (message-send-mail-function . smtpmail-send-it)
	    (mu4e-drafts-folder . "/[Praetortel]/Drafts")
	    (mu4e-sent-folder . "/[Praetortel]/Sent")
	    (mu4e-refile-folder . "/[Praetortel]/All Mail")
	    (mu4e-trash-folder . "/[Praetortel]Trash")))))
  
  (setq mu4e-maildir-shortcuts
    '((:maildir "/[PraetorTEL]/Inbox"    :key ?i)
      (:maildir "/[PraetorTEL]/Sent Mail" :key ?s)
      (:maildir "/[PraetorTEL]/Trash"     :key ?t)
      (:maildir "/[PraetorTEL]/Drafts"    :key ?d)
      (:maildir "/[PraetorTEL]/All Mail"  :key ?a)))
  :init
  (mu4e t))
