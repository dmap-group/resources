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
		satellite2 - satellite
		instrument6 - instrument
	)
)
(:init
	(supports instrument6 image2)
	(supports instrument6 spectrograph0)
	(calibration_target instrument6 star2)
	(on_board instrument6 satellite2)
	(power_avail satellite2)
	(pointing satellite2 phenomenon6)
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