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
		instrument14 - instrument
		instrument15 - instrument
		instrument16 - instrument
		satellite6 - satellite
	)
)
(:init
	(supports instrument14 spectrograph3)
	(supports instrument14 thermograph1)
	(supports instrument14 image0)
	(calibration_target instrument14 star3)
	(supports instrument15 image0)
	(supports instrument15 thermograph1)
	(supports instrument15 image2)
	(calibration_target instrument15 groundstation4)
	(supports instrument16 spectrograph3)
	(supports instrument16 image2)
	(calibration_target instrument16 groundstation0)
	(on_board instrument14 satellite6)
	(on_board instrument15 satellite6)
	(on_board instrument16 satellite6)
	(power_avail satellite6)
	(pointing satellite6 planet11)
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