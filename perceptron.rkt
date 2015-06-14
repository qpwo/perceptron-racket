#lang racket
;; Luke Miles, June 2015
(require (only-in plot/utils vdot v* v+ v=))

(define (sign a)
  (cond [(positive? a) 1]
        [(negative? a) -1]
        [(zero? a) 0]
        [else (error "mystery number: ~a" a)]))

(define (perceive labeled-points)
  (define labels (map cdr labeled-points))
  (define points (map car labeled-points))
  (define (P coefs bias)
    (define-values (new-coefs new-bias)
      (for/fold ([coefs coefs]
                 [bias bias])
                ([point points]
                 [label labels])
        (if (<= (* label (+ (vdot point coefs) bias)) 0)
          (values (v+ coefs (v* point label))
                  (+ bias label))
          (values coefs bias))))
    (if (and (= bias new-bias) (v= coefs new-coefs))
      (values (list coefs bias)
              (λ (point) (sign (+ (vdot point coefs) bias))))
      (P new-coefs new-bias)))
  (P (make-vector (vector-length (car points))) 0))

(provide perceive)
