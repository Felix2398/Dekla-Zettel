;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Aufgabe-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Aufgabe 1.a)
; [X] (list-of X) -> Boolean
; Checks whether a list only has pairs, i.e., lists with exactly two entries, as elements.
(check-expect (list-of-pairs? '((1 2) (3 4) (5 6))) true)
(check-expect (list-of-pairs? '((1 2) (3 4))) true)
(check-expect (list-of-pairs? '((1 2) (3 4 5) (5 6))) false)
(check-expect (list-of-pairs? '((1 2) (3 4) (5))) false)

(define (list-of-pairs? l)
  (match l
    [(list) true]
    [(list (list x y) z ...) (list-of-pairs? z)]
    [else false]))



; Aufgabe 1.b)
;(list-of Number) -> (list-of Posn)
; Converts a list with an even amount of numbers (x1 y1 x2 y2 ... xn yn) into a list of posn instances
(check-expect (flat->posn '( 1 2 3 4)) (list (make-posn 1 2) (make-posn 3 4)))

(define (flat->posn l)
  (match l
    [(list) empty]
    [(list x y z ...) (cons (make-posn x y) (flat->posn z))]))



; Aufgabe 1.c)
; A Tree is either:
; - (make-tree Number Tree Tree)
; - Number
(define-struct tree (value left right))

; Tree -> Number
; Computes the sum of all nodes, i.e., inner nodes as well as leafs, in the tree
(check-expect (sum-values (make-tree 1 2 3)) 6)
(check-expect (sum-values (make-tree 5 (make-tree 1 2 3) (make-tree 10 (make-tree 20 1 1) 5))) 48)

(define (sum-values t)
  (match t
    [(struct tree (x y z)) (+ x (sum-values y) (sum-values z))]
    [x t]))
