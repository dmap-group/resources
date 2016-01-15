(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet10 - direction
	infrared0 - mode
	planet5 - direction
	image2 - mode
	planet9 - direction
	phenomenon8 - direction
	star15 - direction
	star16 - direction
	star11 - direction
	star12 - direction
	phenomenon13 - direction
	phenomenon14 - direction
	star7 - direction
	infrared3 - mode
	star4 - direction
	spectrograph1 - mode
	star6 - direction
	star1 - direction
	star0 - direction
	star2 - direction
	image4 - mode
	groundstation3 - direction

	(:private
		satellite4 - satellite
		instrument8 - instrument
		instrument9 - instrument
		instrument10 - instrument
	)
)
(:init
	(supports instrument8 spectrograph1)
	(supports instrument8 image4)
	(calibration_target instrument8 star4)
	(supports instrument9 infrared3)
	(calibration_target instrument9 star2)
	(supports instrument10 image2)
	(supports instrument10 image4)
	(calibration_target instrument10 star0)
	(on_board instrument8 satellite4)
	(on_board instrument9 satellite4)
	(on_board instrument10 satellite4)
	(power_avail satellite4)
)
(:goal
	(and
		(have_image planet5 image4)
		(have_image star6 infrared3)
		(have_image star7 image4)
		(have_image phenomenon8 image4)
		(have_image planet9 infrared0)
		(have_image planet10 infrared3)
		(have_image star12 image4)
		(have_image phenomenon13 image4)
		(have_image phenomenon14 spectrograph1)
		(have_image star15 spectrograph1)
		(have_image star16 image2)
	)
)
)