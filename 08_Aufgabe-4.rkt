;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Aufgabe-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Aufgabe 4.a)
; [X,Y,Z] (X Y -> Z) X -> (Y -> Z)
; Fixiert den ersten Parameter der binären Funktion f mit x und gibt eine neue unäre Funktion zurück
(check-expect ((partial + 5) 2) 7)
(check-expect ((partial - 10) 6) 4)
(check-expect ((partial * 3) 5) 15)

(define (partial f x)
  (lambda (y) (f x y)))



; Aufgabe 4.b)
; [X] Number (X -> X) -> (X -> X)
; Gibt eine Funktion g zurück, welche die Funktion f n-mal auf ihr Argument x anwendet
(check-expect ((repeated 5 add1) 5) 10)
(check-expect ((repeated 3 (lambda (x) (* x 2))) 2) 16)

(define (repeated n f)
  (cond [(= n 1) f]
        [else (lambda (x)
                (f ((repeated (sub1 n) f) x)))]))



; Aufgabe 4.c)
; [X,Y,Z] (X -> Y) (Y -> Z) -> (X -> Z)
; Verkettet die unären Funktionen f und g miteinander und gibt eine Funktion h zurück, für die gilt: h(x) = g(f(x))
(check-expect ((combine add1 sub1) 1) 1)
(check-expect ((combine (lambda (x) (* 2 x)) add1) 4) 9)
(check-expect ((combine add1 (lambda (x) (* 2 x))) 4) 10)

(define (combine f g)
  (lambda (x) (g (f x)))) 

