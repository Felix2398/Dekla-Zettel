;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Aufgabe-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Aufgabe 2.a)
; Number -> Number
; Calculates the n element of the fibonacci sequenze
(check-expect (fib 1) 1)
(check-expect (fib 2) 1)
(check-expect (fib 9) 34)

(define (fib n)
  (if (and (>= n 1) (<= n 2)) 1 (+ (fib (- n 1)) (fib (- n 2)))))


; Aufgabe 2.b)
; fib/fast : Number -> Number
; Calculates the n element of the fibonacci sequenze
(check-expect (fib/fast 1) 1)
(check-expect (fib/fast 2) 1)
(check-expect (fib/fast 9) 34)
(check-expect (fib/fast 30) 832040)

(define (fib/fast n)
      (local (; accumulator is the (n-1) of the (n-1) of the current element, also the (n-2) of the current element
              (define (fast n1 n2 n)
                (cond
                  [(= n 1) n1]
                  [else (fast (+ n1 n2) n1 (sub1 n))])))
        (fast 1 0 n)))


; Aufgabe 2.c)
; (time (fib 10))
; 0
; (time (fib 40))
; 14.750 
; (time (fib 100))
; nach 20 min noch kein Ergebnis
; (time (fib/fast 10))
; 0
; (time (fib/fast 40))
; 0
; (time (fib/fast 100))
; 0

; fib hat eine wesentlich höhere Laufzeit als fib/fast, da fib eine baumartige Rekursion ist, während fib/fast eine lineare Rekursion ist.
; In für jeden Aufruf von fib wird fib zwei weitere Male aufgerufen, während fib/fast für jeden Aufruf nur ein weiteres mal aufgerufen wird.