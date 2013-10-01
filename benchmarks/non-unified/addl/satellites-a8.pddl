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
    satellite3 - satellite
    instrument3 - instrument
    thermograph1 - mode
    spectrograph1 - mode
    d5 - direction
    d6 - direction
    d7 - direction
    d8 - direction

    satellite4 - satellite
    instrument4 - instrument
    satellite5 - satellite
    instrument5 - instrument
    thermograph2 - mode
    spectrograph2 - mode
    d9 - direction
    d10 - direction
    d11 - direction
    d12 - direction

    satellite6 - satellite
    instrument6 - instrument
    satellite7 - satellite
    instrument7 - instrument
    thermograph3 - mode
    spectrograph3 - mode
    d13 - direction
    d14 - direction
    d15 - direction
    d16 - direction
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
    (supports instrument3 spectrograph1)
    (calibration_target instrument3 d7)
    (calibration_target instrument3 d8)
    (on_board instrument3 satellite3)
    (power_avail satellite3)
    (pointing satellite3 d8)

    (supports instrument4 thermograph2)
    (calibration_target instrument4 d9)
    (calibration_target instrument4 d10)
    (on_board instrument4 satellite4)
    (power_avail satellite4)
    (pointing satellite4 d9)
    (supports instrument5 spectrograph2)
    (calibration_target instrument5 d11)
    (calibration_target instrument5 d12)
    (on_board instrument5 satellite5)
    (power_avail satellite5)
    (pointing satellite5 d12)

    (supports instrument6 thermograph3)
    (calibration_target instrument6 d13)
    (calibration_target instrument6 d14)
    (on_board instrument6 satellite6)
    (power_avail satellite6)
    (pointing satellite6 d13)
    (supports instrument7 spectrograph3)
    (calibration_target instrument7 d15)
    (calibration_target instrument7 d16)
    (on_board instrument7 satellite7)
    (power_avail satellite7)
    (pointing satellite7 d16)
)
(:goal (and
    (have_image d1 thermograph)
    (have_image d3 spectrograph)
    (have_image d5 thermograph1)
    (have_image d7 spectrograph1)
    (have_image d9 thermograph2)
    (have_image d11 spectrograph2)
    (have_image d13 thermograph3)
    (have_image d15 spectrograph3)
))

)
