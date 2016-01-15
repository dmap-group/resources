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
		satellite0 - satellite
		instrument2 - instrument
		instrument0 - instrument
		instrument1 - instrument
	)
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 image4)
	(calibration_target instrument0 star3)
	(supports instrument1 image4)
	(supports instrument1 image2)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 star4)
	(supports instrument2 image2)
	(calibration_target instrument2 star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 star0)
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