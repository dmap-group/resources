(define (problem truck-crane-factory-p1)
    (:domain truck-crane-factory)
    (:requirements :strips :typing)
    (:objects
        A - location
        B - location)
    (:init
        (truck-at A)
        (box-at A)
        (factory-at B))
    (:goal (and
        (factory-started))))
