(define (problem logistics-a3)
    (:domain logistics)
    (:requirements :strips :typing)
    (:objects
        package1 - PACKAGE

        a - CITY
        a-truck - TRUCK

        b - CITY
        b-truck - TRUCK

        c - CITY
        c-truck - TRUCK

        a-po - LOCATION
        ab-po - LOCATION
	bc-po - LOCATION
        c-po - LOCATION
    )
    (:init
        (in-city a-po a)
        (in-city ab-po a)
        (in-city ab-po b)
        (in-city bc-po b)
        (in-city bc-po c)
        (in-city c-po c)

        (at package1 a-po)

        (at a-truck a-po)
        (in-city a-truck a)
        (at b-truck ab-po)
        (in-city b-truck b)
        (at c-truck bc-po)
        (in-city c-truck c)
    )
    (:goal (and
        (at package1 c-po)
    ))
)
