(use awful spiffy)
(include "ezersatz.scm")
(import ezersatz)

(enable-sxml #f)
(when (development-mode?)
  (debug-file "debug.log"))

(define (as-model data)
  (if (string? data) `((content . ,data)) data))

(define (show-dev-mode?)
  (and (member (remote-address) '("127.0.0.1"))
       (development-mode?)))

;; Fill the template with the given data
(define (standard-page data #!key (file "index.tmpl") (page-title "BigButton"))
    (ezersatz file
	      (let* ([data (as-model data)]
		     [data (alist-cons 'page_title page-title data)]
		     [data (if (show-dev-mode?) (alist-cons 'devmode #t data) data)])
		data)))

(define (get-greeting-string salutation #!optional [name "World"])
  (string-append salutation ", " name))

(define-page (main-page-path)
  (lambda () 
    (let* ([whom ($ 'whom "World")]
	   [greeting (get-greeting-string "Hello" whom)])
      (debug whom)
      (standard-page greeting page-title: "Big Button Homepage"))))
