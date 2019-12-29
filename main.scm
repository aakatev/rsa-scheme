(define p 3)
(define q 11)
(define n (* p q))
(define phi 
  (*
    (- p 1)
    (- q 1)))

(define gcd 
 (lambda (a b) 
  (if (= b 0) 
    a 
    (gcd b (mod a b)))))

(define e 
  (do ((i 2 (+ i 1)))
      ((= (gcd i phi) 1) i)
      ()))

(define (inv? d e n)
  (if (= (mod (* d e) n) 1) 
    #t 
    #f))


(define d 
  (do ((i 0 (+ i 1)))
      ((inv? i e phi) i)
      ()))


(define (encrypt x)
  (mod (expt x e) n)
)

(define (decrypt y)
  (mod (expt y d) n)
)

(define x1 4)
(define y1 (encrypt x1))

(define (test) 
  (if (= x1 (decrypt y1)) 
    (display "Decrypted y is equal to x!\n") 
    (display "Decrypted y is not equal to x!\n")))

(test)