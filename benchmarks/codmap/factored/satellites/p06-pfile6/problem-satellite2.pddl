(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	star10 - direction
	star9 - direction
	thermograph2 - mode
	infrared1 - mode
	infrared3 - mode
	planet5 - direction
	planet4 - direction
	star7 - direction
	spectrograph0 - mode
	star1 - direction
	star0 - direction
	star2 - direction
	star6 - direction
	groundstation3 - direction
	phenomenon8 - direction

	(:private
		satellite2 - satellite
		instrument4 - instrument
	)
)
(:init
	(supports instrument4 infrared3)
	(calibration_target instrument4 star0)
	(on_board instrument4 satellite2)
	(power_avail satellite2)
	(pointing satellite2 star6)
)
(:goal
	(and
		(have_image planet4 thermograph2)
		(have_image planet5 spectrograph0)
		(have_image star6 thermograph2)
		(have_image star7 infrared3)
		(have_image phenomenon8 spectrograph0)
		(have_image star9 infrared1)
		(have_image star10 infrared3)
	)
)
)