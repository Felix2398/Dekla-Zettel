;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Aufgabe-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Aufgabe 3.a)
; List-of Numbers, List-of Numbers -> List-of (List-of Numbers)
;
(check-expect (zip '(1 2 3) '(4 5 6)) '((1 4) (2 5) (3 6)))
(check-expect (zip '(1 2 3 5 6) '(4 5 6)) '((1 4) (2 5) (3 6)))
(check-expect (zip '(1) '(4)) '((1 4)))
(check-expect (zip '() '(4)) '())

(define (zip l1 l2)
  (cond [(or (empty? l1) (empty? l2)) empty]
        [else (cons (list (first l1) (first l2)) (zip (rest l1) (rest l2)))]))




; Aufgabe 3.b)
; List-of Numbers, List-of Numbers -> List-of Numbers
(check-expect (zip/with + '(1 2 3) '(4 5 6)) '(5 7 9))
(check-expect (zip/with * '(1 2 3) '(4 5 6)) '(4 10 18))
(check-expect (zip/with - '(1 2 3) '(4 5 6)) '(-3 -3 -3))
(check-expect (zip/with / '(1 2 3) '(1 1 3)) '(1 2 1))

(define (zip/with f l1 l2)
  (local [(define (help l3)
            (local [(define (getValue f)
                      (modulo (expt (f -1 1) 2) 2))]  
            (foldr f (getValue f) l3)))]
    (map help (zip l1 l2))))
