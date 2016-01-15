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
		satellite2 - satellite
		instrument4 - instrument
		instrument5 - instrument
	)
)
(:init
	(supports instrument4 image1)
	(supports instrument4 image0)
	(calibration_target instrument4 star1)
	(supports instrument5 image2)
	(supports instrument5 image0)
	(supports instrument5 image1)
	(calibration_target instrument5 star1)
	(on_board instrument4 satellite2)
	(on_board instrument5 satellite2)
	(power_avail satellite2)
	(pointing satellite2 star6)
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