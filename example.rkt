#lang racket
;; Luke Miles, June 2015
(require "perceptron.rkt")

(define (make-random-point)
  (for/vector ([__ (in-range 5)])
    (- 5 (random 10))))

(define points
  (for/list ([__ (in-range 1000)])
    (let ([point (make-random-point)])
      (cons point
            (if (> (apply + (vector->list point)) 2) 1 -1)))))

(define-values (train-points test-points) (split-at points 100))

(define-values (vals perceiver) (perceive train-points))

(define (correct? point)
  (= (cdr point) (perceiver (car point))))

(exact->inexact (/ (count correct? test-points) (length test-points)))
