(define (problem logistics-a6)
    (:domain logistics)
    (:requirements :strips :typing)
    (:objects
        package1 - PACKAGE
        airplane1 - AIRPLANE
        pgh - CITY
        ny - CITY
        pgh-truck - TRUCK
        ny-truck - TRUCK
        pgh-po - LOCATION
        ny-po - LOCATION
        pgh-airport - AIRPORT
        ny-airport - AIRPORT

        package2 - PACKAGE
        airplane2 - AIRPLANE
        abc - CITY
        def - CITY
        abc-truck - TRUCK
        def-truck - TRUCK
        abc-po - LOCATION
        def-po - LOCATION
        abc-airport - AIRPORT
        def-airport - AIRPORT
    )
    (:init
        (in-city pgh-po pgh)
        (in-city pgh-airport pgh)
        (in-city ny-po ny)
        (in-city ny-airport ny)

        (at package1 pgh-po)
        (at airplane1 pgh-airport)

        (at pgh-truck pgh-po)
        (in-city pgh-truck pgh)
        (at ny-truck ny-po)
        (in-city ny-truck ny)

        (in-city abc-po abc)
        (in-city abc-airport abc)
        (in-city def-po def)
        (in-city def-airport def)
        (at package2 abc-po)
        (at airplane2 abc-airport)

        (at abc-truck abc-po)
        (in-city abc-truck abc)
        (at def-truck def-po)
        (in-city def-truck def)
    )
    (:goal (and
        (at package1 ny-po)
        (at package2 def-po)
    ))
)
