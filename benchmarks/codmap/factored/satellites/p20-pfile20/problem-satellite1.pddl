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
		satellite1 - satellite
		instrument14 - instrument
		instrument15 - instrument
		instrument10 - instrument
		instrument11 - instrument
		instrument12 - instrument
		instrument13 - instrument
	)
)
(:init
	(supports instrument10 infrared1)
	(supports instrument10 thermograph8)
	(supports instrument10 spectrograph6)
	(calibration_target instrument10 star4)
	(supports instrument11 image4)
	(supports instrument11 thermograph7)
	(supports instrument11 infrared1)
	(calibration_target instrument11 groundstation3)
	(supports instrument12 infrared9)
	(supports instrument12 thermograph8)
	(supports instrument12 infrared5)
	(calibration_target instrument12 groundstation3)
	(supports instrument13 image2)
	(supports instrument13 infrared1)
	(calibration_target instrument13 star4)
	(supports instrument14 image3)
	(calibration_target instrument14 groundstation3)
	(supports instrument15 thermograph7)
	(calibration_target instrument15 star2)
	(on_board instrument10 satellite1)
	(on_board instrument11 satellite1)
	(on_board instrument12 satellite1)
	(on_board instrument13 satellite1)
	(on_board instrument14 satellite1)
	(on_board instrument15 satellite1)
	(power_avail satellite1)
	(pointing satellite1 phenomenon19)
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