(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet11 - direction
	planet10 - direction
	planet19 - direction
	phenomenon18 - direction
	star14 - direction
	star16 - direction
	star13 - direction
	star12 - direction
	thermograph1 - mode
	phenomenon17 - direction
	groundstation4 - direction
	groundstation1 - direction
	groundstation0 - direction
	star15 - direction
	planet21 - direction
	planet22 - direction
	planet7 - direction
	phenomenon5 - direction
	image2 - mode
	image0 - mode
	planet8 - direction
	phenomenon9 - direction
	star20 - direction
	phenomenon23 - direction
	star24 - direction
	infrared4 - mode
	spectrograph3 - mode
	planet6 - direction
	star3 - direction
	star2 - direction

	(:private
		satellite2 - satellite
		instrument6 - instrument
	)
)
(:init
	(supports instrument6 image0)
	(calibration_target instrument6 groundstation1)
	(on_board instrument6 satellite2)
	(power_avail satellite2)
	(pointing satellite2 star24)
)
(:goal
	(and
		(have_image phenomenon5 thermograph1)
		(have_image planet6 infrared4)
		(have_image planet7 image0)
		(have_image planet8 thermograph1)
		(have_image phenomenon9 image2)
		(have_image planet10 image0)
		(have_image planet11 infrared4)
		(have_image star12 image0)
		(have_image star13 image0)
		(have_image star14 thermograph1)
		(have_image star15 image0)
		(have_image star16 thermograph1)
		(have_image phenomenon17 infrared4)
		(have_image phenomenon18 spectrograph3)
		(have_image star20 image0)
		(have_image planet21 thermograph1)
		(have_image planet22 image2)
		(have_image phenomenon23 image0)
		(have_image star24 infrared4)
	)
)
)