(module ezersatz
	(ezersatz)

(import scheme chicken)
(require-extension ersatz-lib)
(reexport ersatz-lib)

(define get-std-template-env (make-parameter (template-std-env)))

(define (convert-model simple-model)
  (map (lambda (s)
	 (let ((k (car s))
	       (v (cdr s)))
	   (cond
	     ((boolean? v) (cons k  (Tbool v)))
	     (else (cons k (Tstr v))))))
       simple-model))

(define (ezersatz filename model #!optional template-env template-ctx)
  (let ((t-env (if template-env template-env (get-std-template-env)))
	(model (convert-model model)))
    (from-file filename env: t-env models: model)))
    

)