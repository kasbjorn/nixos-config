(require 'ox-publish)

(setq org-publish-project-alist
      '(
	("org-mysite"
	 :base-directory "~/Projects/mysite/org/"
	 :base-extension "org"
	 :publishing-directory "~/Projects/mysite/jekyll"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4
	 :html-extension "html"
	 :body-only t
	 )

	("org-mysite-static"
	 :base-directory "~/Projects/mysite/org/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/Projects/mysite/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("mysite"
	 :components ("org-mysite" "org-mysite-static"))))
