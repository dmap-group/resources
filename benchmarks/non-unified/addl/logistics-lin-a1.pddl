(define (problem logistics-lin-a1)
    (:domain logistics)
    (:requirements :strips :typing)
    (:objects
        package1 - PACKAGE

        a - CITY
        a-truck - TRUCK

        a-po - LOCATION
        x-po - LOCATION
    )
    (:init
        (in-city a-po a)
        (in-city x-po a)

        (at package1 a-po)

        (at a-truck a-po)
        (in-city a-truck a)
    )
    (:goal (and
        (at package1 x-po)
    ))
)
