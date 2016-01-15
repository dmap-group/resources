(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	phenomenon6 - direction
	phenomenon5 - direction
	image2 - mode
	planet9 - direction
	phenomenon8 - direction
	thermograph0 - mode
	star7 - direction
	star4 - direction
	spectrograph1 - mode
	star3 - direction
	groundstation2 - direction
	groundstation1 - direction
	groundstation0 - direction

	(:private
		satellite0 - satellite
		instrument0 - instrument
		instrument1 - instrument
		instrument2 - instrument
	)
)
(:init
	(supports instrument0 image2)
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 groundstation2)
	(supports instrument1 thermograph0)
	(supports instrument1 spectrograph1)
	(supports instrument1 image2)
	(calibration_target instrument1 groundstation1)
	(supports instrument2 image2)
	(calibration_target instrument2 groundstation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 phenomenon8)
)
(:goal
	(and
		(have_image star3 thermograph0)
		(have_image phenomenon5 image2)
		(have_image phenomenon6 image2)
		(have_image star7 thermograph0)
		(have_image phenomenon8 image2)
		(have_image planet9 spectrograph1)
	)
)
)