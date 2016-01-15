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
		instrument3 - instrument
		satellite1 - satellite
		instrument4 - instrument
		instrument5 - instrument
	)
)
(:init
	(supports instrument3 image2)
	(supports instrument3 image3)
	(supports instrument3 image4)
	(calibration_target instrument3 star2)
	(supports instrument4 image3)
	(supports instrument4 image2)
	(calibration_target instrument4 star3)
	(supports instrument5 image4)
	(supports instrument5 infrared1)
	(supports instrument5 spectrograph0)
	(calibration_target instrument5 star3)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 planet11)
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