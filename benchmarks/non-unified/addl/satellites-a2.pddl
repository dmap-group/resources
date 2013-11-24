(define (problem satellites-a2)
(:domain satellites)
(:requirements :strips :typing)
(:objects
    satellite0 - satellite
    instrument0 - instrument
    satellite1 - satellite
    instrument1 - instrument

    thermograph - mode
    spectrograph - mode

    d1 - direction
    d2 - direction
    d3 - direction
    d4 - direction

)
(:init
    (supports instrument0 thermograph)
    (calibration_target instrument0 d1)
    (calibration_target instrument0 d2)
    (on_board instrument0 satellite0)
    (power_avail satellite0)
    (pointing satellite0 d1)

    (supports instrument1 spectrograph)
    (calibration_target instrument1 d3)
    (calibration_target instrument1 d4)
    (on_board instrument1 satellite1)
    (power_avail satellite1)
    (pointing satellite1 d4)
)
(:goal (and
    (have_image d1 thermograph)
    (have_image d3 spectrograph)

))

)
