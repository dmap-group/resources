(define (problem logistics-a4)
    (:domain logistics)
    (:requirements :strips :typing)
    (:objects
        package1 - PACKAGE
        package2 - PACKAGE

        airplane1 - AIRPLANE
        airplane2 - AIRPLANE

        pgh - CITY
        ny - CITY

        pgh-truck - TRUCK
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
        (at package2 ny-airport)

        (at airplane1 pgh-airport)
        (at airplane2 ny-airport)

        (at pgh-truck pgh-po)
        (in-city pgh-truck pgh)
        (at ny-truck ny-po)
        (in-city ny-truck ny)
    )
    (:goal (and
        (at package1 ny-po)
        (at package2 pgh-po)
    ))
)