#lang racket

; Conditionals

; There are some basic predicates that we've already dealt with like "zero?"
; and "symbol=?". 

(zero? 0)
(zero? 1)

(symbol=? 'a 'b)
(symbol=? 'a 'a)

; But structures also come with their own predefined predicates. These kinds
; of predicates are called "Type Predicates" 

(struct employee (name age))
(define bob (employee "Bob" 25))

(employee? bob)

; The basic data types come with their own sets of type predicates too 

; numbers
1
(number? 1)
(number? "hello")

; strings
"Hello"
(string? "hello")
(string? 1)

; Symbols
'a
(symbol? 'a)
(symbol? "hello")

; booleans
false
#t
#true

(boolean? true)
(boolean? #false)
(boolean? "hello")

; and for lists as well 

(list? '(1 2 3))
(empty? '())
(empty? empty)
(empty? '(1 2))

; The cons type predicate seems to tell you if the given structure is a cons cell
; or not

(cons? '1)
(cons? '(1 2))

; Numbers get even more crazier predicates

(real? 1)
(real? 1.0)
(real? (sqrt -1))

(integer? 1)
(integer? -1)

(rational? 2/3)
(rational? 2)

; Eqality predicates also exist for most types as "<type>=?"

(boolean=? #t #f)
(boolean=? #t #t)

(string=? "hello" "world")
(string=? "hello" "hello")

(equal? 1 1)

; let us check equality for structures
(define rob (employee "Rob" 25))
(equal? rob (employee "Rob" 25))

; this will show us a #f since structures in racket are declared opaque by 
; default. Let us make employee a transparent struct
(struct employee-trans (name age)
  #:transparent)

; and try the comparison
(define rob-trans (employee-trans "Rob" 25))
(equal? rob-trans (employee-trans "Rob" 25)) ; which now returns #t :) 

