(define (problem strips-sat-x-1)
(:domain satellite)
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

    satellite2 - satellite
    instrument2 - instrument
    thermograph1 - mode
    d5 - direction
    d6 - direction
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

    (supports instrument2 thermograph1)
    (calibration_target instrument2 d5)
    (calibration_target instrument2 d6)
    (on_board instrument2 satellite2)
    (power_avail satellite2)
    (pointing satellite2 d5)
)
(:goal (and
    (have_image d1 thermograph)
    (have_image d3 spectrograph)
    (have_image d5 thermograph1)

))

)
