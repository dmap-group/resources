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
		instrument3 - instrument
		satellite1 - satellite
		instrument4 - instrument
		instrument5 - instrument
	)
)
(:init
	(supports instrument3 thermograph2)
	(supports instrument3 image0)
	(calibration_target instrument3 groundstation1)
	(supports instrument4 thermograph1)
	(calibration_target instrument4 star4)
	(supports instrument5 thermograph2)
	(supports instrument5 thermograph1)
	(supports instrument5 spectrograph3)
	(calibration_target instrument5 star0)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 star4)
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