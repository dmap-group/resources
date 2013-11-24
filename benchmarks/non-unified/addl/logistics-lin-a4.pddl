(define (problem logistics-lin-a4)
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

        d - CITY
        d-truck - TRUCK

        a-po - LOCATION
        ab-po - LOCATION
	bc-po - LOCATION
	cd-po - LOCATION
        d-po - LOCATION
    )
    (:init
        (in-city a-po a)
        (in-city ab-po a)
        (in-city ab-po b)
        (in-city bc-po b)
        (in-city bc-po c)
        (in-city cd-po c)
        (in-city cd-po d)
        (in-city d-po d)

        (at package1 a-po)

        (at a-truck a-po)
        (in-city a-truck a)
        (at b-truck ab-po)
        (in-city b-truck b)
        (at c-truck bc-po)
        (in-city c-truck c)
        (at d-truck cd-po)
        (in-city d-truck d)
    )
    (:goal (and
        (at package1 d-po)
    ))
)
