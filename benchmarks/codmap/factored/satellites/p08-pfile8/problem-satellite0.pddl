(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet11 - direction
	thermograph2 - mode
	phenomenon5 - direction
	image0 - mode
	phenomenon8 - direction
	phenomenon9 - direction
	star10 - direction
	thermograph1 - mode
	phenomenon12 - direction
	phenomenon13 - direction
	phenomenon14 - direction
	spectrograph3 - mode
	star4 - direction
	star7 - direction
	star6 - direction
	star0 - direction
	star3 - direction
	star2 - direction
	groundstation1 - direction

	(:private
		instrument2 - instrument
		instrument0 - instrument
		instrument1 - instrument
		satellite0 - satellite
	)
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 image0)
	(calibration_target instrument0 star3)
	(supports instrument1 spectrograph3)
	(supports instrument1 thermograph2)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 star2)
	(supports instrument2 spectrograph3)
	(calibration_target instrument2 star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 phenomenon14)
)
(:goal
	(and
		(have_image phenomenon5 thermograph1)
		(have_image star6 thermograph1)
		(have_image star7 spectrograph3)
		(have_image phenomenon8 image0)
		(have_image phenomenon9 image0)
		(have_image star10 spectrograph3)
		(have_image planet11 thermograph2)
		(have_image phenomenon12 image0)
		(have_image phenomenon13 thermograph1)
		(have_image phenomenon14 thermograph2)
	)
)
)