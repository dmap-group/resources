(define (problem logistics-e2)
    (:domain logistics)
    (:requirements :strips :typing)
    (:objects
        package1 - PACKAGE

        airplane1 - AIRPLANE

        pgh - CITY
        ny - CITY

        ny-truck - TRUCK

        pgh-po - LOCATION
        ny-po - LOCATION

        pgh-airport - AIRPORT
        ny-airport - AIRPORT
    )
    (:init
        (in-city pgh-po pgh)
        (in-city pgh-airport pgh)

        (in-city ny-po ny)
        (in-city ny-airport ny)

        (at package1 pgh-airport)

        (at airplane1 pgh-airport)

        (at ny-truck ny-po)
        (in-city ny-truck ny)
    )
    (:goal (and
        (at package1 ny-po)
    ))
)
