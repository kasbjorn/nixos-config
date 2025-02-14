(defun play-anonradio ()
   "Play defcon Radio"
   (interactive)
   (emms-play-streamlist "http://anonradio.net:8000/anonradio"))

(defun play-tilderadio ()
  "Play tilde Radio"
  (interactive)
  (emms-play-streamlist "https://tilderadio.org/listen"))
