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
		satellite1 - satellite
		instrument3 - instrument
	)
)
(:init
	(supports instrument3 image0)
	(supports instrument3 image2)
	(calibration_target instrument3 groundstation4)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 groundstation0)
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