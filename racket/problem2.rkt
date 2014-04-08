#lang racket
(require racket/generator)
(define fibonacci
   (generator ()
     (let loop ((i 0) (j 1))
       (yield i)
       (loop j (+ i j)))))

(apply + (for/list ([i (in-producer fibonacci)]
           #:when (even? i)
           #:break (> i 4000000)
           ) i))