(setf (uiop/os:getenv "WEBKIT_DISABLE_COMPOSITING_MODE") "1")

(define-configuration browser
  ((theme theme:+dark-theme+)))

(define-configuration (input-buffer)
  ((default-modes (pushnew 'nyxt/mode/emacs:emacs-mode %slot-value%))))
