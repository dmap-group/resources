(define (problem logistics-lin-a2)
    (:domain logistics)
    (:requirements :strips :typing)
    (:objects
        package1 - PACKAGE

        a - CITY
        a-truck - TRUCK

        b - CITY
        b-truck - TRUCK

        a-po - LOCATION
        ab-po - LOCATION
        b-po - LOCATION
    )
    (:init
        (in-city a-po a)
        (in-city ab-po a)
        (in-city ab-po b)
        (in-city b-po b)

        (at package1 a-po)

        (at a-truck a-po)
        (in-city a-truck a)
        (at b-truck ab-po)
        (in-city b-truck b)
    )
    (:goal (and
        (at package1 b-po)
    ))
)
