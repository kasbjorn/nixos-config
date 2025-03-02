(defun my/connect-irc ()
  (interactive)

  (erc-tls
   :server "znc.tilde.team"
   :port 6697
   :password "praetor/SDF:M@ck3y242"
   :nick "praetor")
  (erc-tls
   :server "znc.tilde.team"
   :port 6697
   :password "praetor/Team:M@ck3y242"
   :nick "praetor")
  (erc-tls
   :server "znc.tilde.team"
   :port 6697
   :password "praetor/Libera:M@ck3y242"
   :nick "praetor"))

