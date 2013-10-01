(define (problem truck-crane-p1)
    (:domain truck-crane)
    (:requirements :strips :typing)
    (:objects
        A - location
        B - location)
    (:init
        (truck-at A)
        (box-at A))
    (:goal (and
        (box-at B))))
