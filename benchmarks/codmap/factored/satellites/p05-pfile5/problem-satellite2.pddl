(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	phenomenon6 - direction
	phenomenon5 - direction
	image2 - mode
	planet9 - direction
	phenomenon8 - direction
	thermograph0 - mode
	star7 - direction
	star4 - direction
	spectrograph1 - mode
	star3 - direction
	groundstation2 - direction
	groundstation1 - direction
	groundstation0 - direction

	(:private
		satellite2 - satellite
		instrument8 - instrument
		instrument6 - instrument
		instrument7 - instrument
	)
)
(:init
	(supports instrument6 image2)
	(calibration_target instrument6 groundstation1)
	(supports instrument7 image2)
	(supports instrument7 thermograph0)
	(calibration_target instrument7 groundstation1)
	(supports instrument8 spectrograph1)
	(supports instrument8 image2)
	(supports instrument8 thermograph0)
	(calibration_target instrument8 groundstation0)
	(on_board instrument6 satellite2)
	(on_board instrument7 satellite2)
	(on_board instrument8 satellite2)
	(power_avail satellite2)
	(pointing satellite2 phenomenon5)
)
(:goal
	(and
		(have_image star3 thermograph0)
		(have_image phenomenon5 image2)
		(have_image phenomenon6 image2)
		(have_image star7 thermograph0)
		(have_image phenomenon8 image2)
		(have_image planet9 spectrograph1)
	)
)
)