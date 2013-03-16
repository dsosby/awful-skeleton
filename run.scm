(use awful spiffy ezersatz)

(enable-sxml #f)
(define DefaultPageTitle (make-parameter "TODO:PageTitle"))
(define DefaultPageTemplate (make-parameter "index.tmpl"))

(when (development-mode?)
  (debug-file "debug.log"))

(define (as-model data)
  (if (string? data) `((content . ,data)) data))

(define (show-dev-mode?)
  (and (member (remote-address) '("127.0.0.1"))
       (development-mode?)))

;; Fill the template with the given data
(define (standard-page data #!key (file (DefaultPageTemplate)) (page-title (DefaultPageTitle)))
    (ezersatz file
	      (let* ([data (as-model data)]
		     [data (alist-cons 'page_title page-title data)]
		     [data (if (show-dev-mode?) (alist-cons 'devmode #t data) data)])
		data)))

(define-page (main-page-path)
  (lambda () 
    (debug "This is how you log stuff")
    (standard-page "I don't do much" page-title: "Hello World!")))
