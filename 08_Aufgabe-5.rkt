;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Aufgabe-5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Aufgabe 5.a)
; [X] (X -> Boolean) (list-of X) -> (list-of X)
; Gibt alle Elemente der Liste l zurück, welche die Bedingung p erfüllen
(check-expect (my-filter (lambda (x) (> x 5)) '(2 10 4 3 7 8)) '(10 7 8))

(define (my-filter p l)
  (foldr (lambda (x y) (if (p x) (cons x y) (remove x y))) empty l))



; Aufgabe 5.b)
; [X] (X -> Boolean) (list-of X) -> Boolean
; Gibt true zurück, wenn alle Elemente der Liste l die Eigenschaft p erfüllen, ansonsten false
(check-expect (forall (lambda (x) (> x 5)) '(2 10 4 3 7 8 3)) false)
(check-expect (forall (lambda (x) (> x 5)) '(10 7 8)) true)
(check-expect (forall (lambda (x) (> x 5)) '()) true)

(define (forall p l)
  (foldr (lambda (x y) (if (p x) (and true y) (and false y))) true l))



; Aufgabe 5.c)
; [X] (X -> Boolean) (list-of X) -> Boolean
; Gibt true zurück, wenn die Liste l mindestens ein Element enthält, dass die Eigenschaft p erfüllt, ansonsten false
(check-expect (exists (lambda (x) (> x 5)) '(2 1 4 3 5 3)) false)
(check-expect (exists (lambda (x) (> x 5)) '(10 7 8)) true)
(check-expect (exists (lambda (x) (> x 5)) '(1 2 3 10 4 5)) true)

(define (exists p l)
  (foldr (lambda (x y) (if (p x) (or true y) (or false y))) false l))



; Aufgabe 5.d)
; [X,Y] (X -> Y) (list-of X) -> (list-of Y)
; Bildet jedes Element der Liste l mithilfe der Funktion f auf eine neue Liste ab und gibt diese zurück
(check-expect (my-map add1 '(1 2 3 4)) '(2 3 4 5))

(define (my-map f l)
  (foldr (lambda (x y) (cons (f x) y)) empty l))
