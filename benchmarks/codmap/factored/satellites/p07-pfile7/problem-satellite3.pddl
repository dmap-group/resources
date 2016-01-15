(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet11 - direction
	planet10 - direction
	phenomenon5 - direction
	image2 - mode
	image3 - mode
	image1 - mode
	image0 - mode
	planet9 - direction
	planet8 - direction
	star7 - direction
	star6 - direction
	star1 - direction
	star3 - direction
	groundstation4 - direction
	groundstation2 - direction
	groundstation0 - direction

	(:private
		satellite3 - satellite
		instrument6 - instrument
		instrument7 - instrument
	)
)
(:init
	(supports instrument6 image2)
	(supports instrument6 image1)
	(supports instrument6 image0)
	(calibration_target instrument6 groundstation4)
	(supports instrument7 image3)
	(supports instrument7 image0)
	(supports instrument7 image1)
	(calibration_target instrument7 groundstation0)
	(on_board instrument6 satellite3)
	(on_board instrument7 satellite3)
	(power_avail satellite3)
	(pointing satellite3 groundstation2)
)
(:goal
	(and
		(have_image phenomenon5 image0)
		(have_image star6 image1)
		(have_image star7 image0)
		(have_image planet8 image0)
		(have_image planet9 image3)
		(have_image planet10 image0)
		(have_image planet11 image2)
	)
)
)