(define (problem logistics-lin-a7)
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

        e - CITY
        e-truck - TRUCK

        f - CITY
        f-truck - TRUCK

        g - CITY
        g-truck - TRUCK

        h - CITY
        h-truck - TRUCK

        i - CITY
        i-truck - TRUCK

        j - CITY
        j-truck - TRUCK

        a1 - CITY
        a1-truck - TRUCK

        b1 - CITY
        b1-truck - TRUCK

        c1 - CITY
        c1-truck - TRUCK

        d1 - CITY
        d1-truck - TRUCK

        e1 - CITY
        e1-truck - TRUCK

        a-po - LOCATION
        ab-po - LOCATION
        bc-po - LOCATION
        cd-po - LOCATION
        de-po - LOCATION
        ef-po - LOCATION
        fg-po - LOCATION
        gh-po - LOCATION
        hi-po - LOCATION
        ij-po - LOCATION
        ja1-po - LOCATION
        a1b1-po - LOCATION
        b1c1-po - LOCATION
        c1d1-po - LOCATION
        d1e1-po - LOCATION
        e1-po - LOCATION
    )
    (:init
        (in-city a-po a)
        (in-city ab-po a)
        (in-city ab-po b)
        (in-city bc-po b)
        (in-city bc-po c)
        (in-city cd-po c)
        (in-city cd-po d)
        (in-city de-po d)
        (in-city de-po e)
        (in-city ef-po e)
        (in-city ef-po f)
        (in-city fg-po f)
        (in-city fg-po g)
        (in-city gh-po g)
        (in-city gh-po h)
        (in-city hi-po h)
        (in-city hi-po i)
        (in-city ij-po i)
        (in-city ij-po j)
        (in-city ja1-po j)
        (in-city ja1-po a1)
        (in-city a1b1-po a1)
        (in-city a1b1-po b1)
        (in-city b1c1-po b1)
        (in-city b1c1-po c1)
        (in-city c1d1-po c1)
        (in-city c1d1-po d1)
        (in-city d1e1-po d1)
        (in-city d1e1-po e1)
        (in-city e1-po e1)

        (at package1 a-po)

        (at a-truck a-po)
        (in-city a-truck a)
        (at b-truck ab-po)
        (in-city b-truck b)
        (at c-truck bc-po)
        (in-city c-truck c)
        (at d-truck cd-po)
        (in-city d-truck d)
        (at e-truck de-po)
        (in-city e-truck e)
        (at f-truck ef-po)
        (in-city f-truck f)
        (at g-truck fg-po)
        (in-city g-truck g)
        (at h-truck gh-po)
        (in-city h-truck h)
        (at i-truck hi-po)
        (in-city i-truck i)
        (at j-truck ij-po)
        (in-city j-truck j)
        (at a1-truck ja1-po)
        (in-city a1-truck a1)
        (at b1-truck a1b1-po)
        (in-city b1-truck b1)
        (at c1-truck b1c1-po)
        (in-city c1-truck c1)
        (at d1-truck c1d1-po)
        (in-city d1-truck d1)
        (at e1-truck d1e1-po)
        (in-city e1-truck e1)
    )
    (:goal (and
        (at package1 e1-po)
    ))
)
