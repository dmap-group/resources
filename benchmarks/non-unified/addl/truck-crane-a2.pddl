(define (problem truck-crane-a2)
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
