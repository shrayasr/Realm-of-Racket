#lang racket

;; basic data structures in racket

; integers
1

; symbols
'hello

; booleans
#t

; strings
"Hello"

#|
cons cells 
  These are the most native representative of lists in racket. A cons cell can have 2 parts to it, any basic ds or 
another cons cell itself :) Lists are just one cons cell pointing to another cons cell. 
|#

;; Empty cell
'()
empty

;; a basic cons cell
(cons 'foo empty)
(cons 'foo '())

;; multiple cons cells
(cons 'foo (cons 'bar '()))

;; a list can be represented by "quoting"
'(1 2 3)

;; ^ this actually evaluates to the following cons cell
(cons 1 (cons 2 (cons 3 empty)))

#|
Functions on lists
  Since lists form such an integral part of the language, there are multiple
sets of functions that can be used to destructure lists
|#

;; first fetches you the first item in a list
(first '(1 2))

;; rest fetches you everything BUT the first item in a list
(rest '(1 2 3 4 5))

;; the same can be done with 'car' and 'cdr' as well respectively (old names) 
(car '(1 2 3)) ; first
(cdr '(1 2 3 4 5)) ; rest

;; the "list" function can also be used to create a list
(list 1 2 3)
(list 'foo 'bar)

