(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet13 - direction
	planet15 - direction
	planet17 - direction
	planet18 - direction
	phenomenon19 - direction
	star16 - direction
	star11 - direction
	star10 - direction
	phenomenon12 - direction
	phenomenon14 - direction
	thermograph7 - mode
	star6 - direction
	groundstation3 - direction
	groundstation1 - direction
	star0 - direction
	phenomenon21 - direction
	thermograph8 - mode
	planet22 - direction
	planet7 - direction
	phenomenon5 - direction
	image3 - mode
	image2 - mode
	planet9 - direction
	phenomenon8 - direction
	image4 - mode
	star20 - direction
	star23 - direction
	star24 - direction
	infrared9 - mode
	infrared5 - mode
	infrared1 - mode
	star4 - direction
	spectrograph0 - mode
	spectrograph6 - mode
	star2 - direction

	(:private
		instrument8 - instrument
		instrument9 - instrument
		instrument2 - instrument
		instrument3 - instrument
		instrument0 - instrument
		instrument1 - instrument
		instrument6 - instrument
		instrument7 - instrument
		instrument4 - instrument
		instrument5 - instrument
		satellite0 - satellite
	)
)
(:init
	(supports instrument0 image3)
	(calibration_target instrument0 star2)
	(supports instrument1 infrared9)
	(calibration_target instrument1 star4)
	(supports instrument2 thermograph8)
	(supports instrument2 image2)
	(supports instrument2 image4)
	(calibration_target instrument2 star4)
	(supports instrument3 infrared9)
	(calibration_target instrument3 star0)
	(supports instrument4 image3)
	(supports instrument4 thermograph8)
	(calibration_target instrument4 groundstation3)
	(supports instrument5 infrared9)
	(supports instrument5 image4)
	(calibration_target instrument5 groundstation3)
	(supports instrument6 infrared1)
	(calibration_target instrument6 groundstation3)
	(supports instrument7 thermograph8)
	(supports instrument7 spectrograph6)
	(calibration_target instrument7 groundstation1)
	(supports instrument8 spectrograph0)
	(supports instrument8 infrared9)
	(supports instrument8 thermograph7)
	(calibration_target instrument8 star2)
	(supports instrument9 thermograph7)
	(calibration_target instrument9 star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(on_board instrument3 satellite0)
	(on_board instrument4 satellite0)
	(on_board instrument5 satellite0)
	(on_board instrument6 satellite0)
	(on_board instrument7 satellite0)
	(on_board instrument8 satellite0)
	(on_board instrument9 satellite0)
	(power_avail satellite0)
	(pointing satellite0 groundstation1)
)
(:goal
	(and
		(have_image phenomenon5 thermograph8)
		(have_image phenomenon5 spectrograph0)
		(have_image phenomenon5 image3)
		(have_image star6 spectrograph0)
		(have_image star6 spectrograph6)
		(have_image star6 image3)
		(have_image planet7 spectrograph6)
		(have_image planet7 infrared5)
		(have_image planet7 image2)
		(have_image phenomenon8 spectrograph6)
		(have_image phenomenon8 infrared5)
		(have_image phenomenon8 thermograph7)
		(have_image planet9 spectrograph6)
		(have_image star10 spectrograph6)
		(have_image star11 thermograph7)
		(have_image star11 image4)
		(have_image star11 image3)
		(have_image phenomenon12 image4)
		(have_image planet13 infrared5)
		(have_image planet13 spectrograph6)
		(have_image planet13 image2)
		(have_image phenomenon14 thermograph7)
		(have_image planet15 image3)
		(have_image star16 image3)
		(have_image star16 image4)
		(have_image planet18 infrared9)
		(have_image planet18 infrared5)
		(have_image planet18 thermograph7)
		(have_image phenomenon19 image2)
		(have_image phenomenon19 image4)
		(have_image star20 spectrograph0)
		(have_image phenomenon21 image4)
		(have_image phenomenon21 image2)
		(have_image phenomenon21 thermograph7)
		(have_image planet22 image2)
		(have_image planet22 spectrograph6)
		(have_image star23 image2)
		(have_image star23 infrared9)
		(have_image star24 spectrograph6)
		(have_image star24 infrared5)
	)
)
)