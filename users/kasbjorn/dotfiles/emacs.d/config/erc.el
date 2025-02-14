(defun my/connect-irc ()
  (interactive)
  (setq erc-autojoin-channels-alist '(("irc.libera.chat" "#lispcafe" "#norge")
				      ("irc.sdf.org" "#sdf")
				      ("irc.tilde.chat" "#meta")))
  (erc-tls
   :server "irc.libera.chat"
   :port 6697
   :nick "praetor")
  (erc-tls
   :server "irc.sdf.org"
   :port 6697
   :nick "praetor")
  (erc-tls
   :server "irc.tilde.chat"
   :port 6697
   :nick "praetor"))
  
