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
		satellite2 - satellite
		instrument16 - instrument
		instrument17 - instrument
		instrument18 - instrument
		instrument19 - instrument
	)
)
(:init
	(supports instrument16 infrared9)
	(supports instrument16 image2)
	(calibration_target instrument16 star4)
	(supports instrument17 infrared5)
	(calibration_target instrument17 star0)
	(supports instrument18 infrared9)
	(calibration_target instrument18 groundstation1)
	(supports instrument19 infrared5)
	(supports instrument19 image2)
	(calibration_target instrument19 groundstation3)
	(on_board instrument16 satellite2)
	(on_board instrument17 satellite2)
	(on_board instrument18 satellite2)
	(on_board instrument19 satellite2)
	(power_avail satellite2)
	(pointing satellite2 phenomenon14)
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