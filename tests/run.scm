(use test)
(load-relative "../run.scm")

(test-group "as-model"
  (test '() (as-model '()))
  (test '((content . "Hello")) (as-model "Hello"))
  (test '((content . "Hello")) (as-model '((content . "Hello")))))

(define (show-dev-mode-test dev-mode address)
  (parameterize ([development-mode? dev-mode]
		 [remote-address address])
    (show-dev-mode?)))

(test-group "show-dev-mode?"
  (test #f (show-dev-mode-test #f "127.0.0.1"))
  (test #f (show-dev-mode-test #f "169.254.0.1"))
  (test #f (show-dev-mode-test #t "169.254.0.1"))
  (test #t (show-dev-mode-test #t "127.0.0.1")))

(test-exit)
