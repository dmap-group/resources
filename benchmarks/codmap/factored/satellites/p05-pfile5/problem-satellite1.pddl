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
		satellite1 - satellite
		instrument3 - instrument
		instrument4 - instrument
		instrument5 - instrument
	)
)
(:init
	(supports instrument3 spectrograph1)
	(supports instrument3 thermograph0)
	(calibration_target instrument3 groundstation0)
	(supports instrument4 image2)
	(supports instrument4 spectrograph1)
	(calibration_target instrument4 groundstation2)
	(supports instrument5 image2)
	(supports instrument5 spectrograph1)
	(supports instrument5 thermograph0)
	(calibration_target instrument5 groundstation1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 groundstation2)
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