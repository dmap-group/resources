(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet11 - direction
	thermograph2 - mode
	phenomenon5 - direction
	image0 - mode
	phenomenon8 - direction
	phenomenon9 - direction
	star10 - direction
	thermograph1 - mode
	phenomenon12 - direction
	phenomenon13 - direction
	phenomenon14 - direction
	spectrograph3 - mode
	star4 - direction
	star7 - direction
	star6 - direction
	star0 - direction
	star3 - direction
	star2 - direction
	groundstation1 - direction

	(:private
		satellite3 - satellite
		instrument8 - instrument
		instrument9 - instrument
	)
)
(:init
	(supports instrument8 image0)
	(calibration_target instrument8 star3)
	(supports instrument9 spectrograph3)
	(supports instrument9 thermograph1)
	(supports instrument9 image0)
	(calibration_target instrument9 star4)
	(on_board instrument8 satellite3)
	(on_board instrument9 satellite3)
	(power_avail satellite3)
	(pointing satellite3 phenomenon5)
)
(:goal
	(and
		(have_image phenomenon5 thermograph1)
		(have_image star6 thermograph1)
		(have_image star7 spectrograph3)
		(have_image phenomenon8 image0)
		(have_image phenomenon9 image0)
		(have_image star10 spectrograph3)
		(have_image planet11 thermograph2)
		(have_image phenomenon12 image0)
		(have_image phenomenon13 thermograph1)
		(have_image phenomenon14 thermograph2)
	)
)
)