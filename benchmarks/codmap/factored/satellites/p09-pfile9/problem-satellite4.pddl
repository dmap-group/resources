(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet11 - direction
	planet10 - direction
	planet5 - direction
	phenomenon7 - direction
	phenomenon6 - direction
	image3 - mode
	image2 - mode
	phenomenon8 - direction
	image4 - mode
	star14 - direction
	phenomenon12 - direction
	phenomenon13 - direction
	infrared1 - mode
	star4 - direction
	spectrograph0 - mode
	star0 - direction
	star3 - direction
	star2 - direction
	star9 - direction
	groundstation1 - direction

	(:private
		satellite4 - satellite
		instrument8 - instrument
		instrument9 - instrument
		instrument10 - instrument
	)
)
(:init
	(supports instrument8 image4)
	(supports instrument8 infrared1)
	(supports instrument8 image3)
	(calibration_target instrument8 groundstation1)
	(supports instrument9 image4)
	(calibration_target instrument9 star0)
	(supports instrument10 image2)
	(supports instrument10 infrared1)
	(supports instrument10 image4)
	(calibration_target instrument10 star2)
	(on_board instrument8 satellite4)
	(on_board instrument9 satellite4)
	(on_board instrument10 satellite4)
	(power_avail satellite4)
	(pointing satellite4 star9)
)
(:goal
	(and
		(have_image planet5 image2)
		(have_image phenomenon6 image3)
		(have_image phenomenon7 infrared1)
		(have_image phenomenon8 image2)
		(have_image star9 image3)
		(have_image planet10 image4)
		(have_image planet11 spectrograph0)
		(have_image phenomenon12 image3)
		(have_image phenomenon13 spectrograph0)
		(have_image star14 image4)
	)
)
)