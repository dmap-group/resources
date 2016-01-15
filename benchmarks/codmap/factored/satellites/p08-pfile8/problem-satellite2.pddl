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
		satellite2 - satellite
		instrument6 - instrument
		instrument7 - instrument
	)
)
(:init
	(supports instrument6 thermograph1)
	(supports instrument6 thermograph2)
	(calibration_target instrument6 star3)
	(supports instrument7 thermograph2)
	(supports instrument7 thermograph1)
	(supports instrument7 image0)
	(calibration_target instrument7 star0)
	(on_board instrument6 satellite2)
	(on_board instrument7 satellite2)
	(power_avail satellite2)
	(pointing satellite2 star6)
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