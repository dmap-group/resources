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
		instrument2 - instrument
		instrument0 - instrument
		instrument1 - instrument
		satellite0 - satellite
	)
)
(:init
	(supports instrument0 image1)
	(supports instrument0 image3)
	(calibration_target instrument0 star1)
	(supports instrument1 image3)
	(calibration_target instrument1 groundstation0)
	(supports instrument2 image0)
	(calibration_target instrument2 groundstation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 star6)
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