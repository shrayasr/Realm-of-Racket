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

#|
Structures
    structs are used to combine a fixed number of items together. They are used
when the structure of some data is predefined
|#

;; consider an person. His details could be represented by a structure like so:
(struct person (name age sex))

;; "person" now becomes a valid structure to use, lets create a person
(person "shrayas" 25 'm)

#|
accessors as a way to retrieve data out of a structure. These are also called
field selectors or just selectors
|#
(define shrayas (person "Shrayas" 25 'm))
(person-name shrayas)
(person-age shrayas)
(person-sex shrayas)

;; a list of structs make sense to store similar data in one place

;; lets create more people
(define meow (person "Meow" 25 'f))
(define gugu (person "Gugu" 25 'm))
(define nishi (person "Nishi" 26 'm))
(define keerthi (person "Keerthi" 26 'f))
(define alfy (person "Alfy" 26 'm))

;; lets put them all together!
(define friends-of-shrayas (list meow gugu nishi keerthi))

;; more fun
(struct friends (school bachelors masters))
(define all-my-friends 
  (friends (list meow)
           (list alfy)
           (list gugu nishi keerthi)))

(person-name (first (friends-school all-my-friends)))

;; by default racket's structures aren't transparent. 
;; meaning, if we print an instance of a structure after we create it
(person "Foo" 200 'm)
;; it prints #<person>

;; to make a structure transparent, we need to add the #:transparent option
;; when creating a structure
(struct person-t (name age sex) #:transparent)

;; now creating a instance prints
(person-t "Bar" 300 'f)
;; (person-t "Bar" 300 'f) instead of the older #<person> :)