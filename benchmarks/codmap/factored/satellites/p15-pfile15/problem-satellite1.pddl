(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet11 - direction
	planet14 - direction
	planet17 - direction
	thermograph4 - mode
	star15 - direction
	star13 - direction
	star12 - direction
	phenomenon10 - direction
	thermograph3 - mode
	star19 - direction
	star18 - direction
	phenomenon16 - direction
	groundstation2 - direction
	groundstation0 - direction
	star4 - direction
	planet20 - direction
	planet21 - direction
	planet22 - direction
	planet23 - direction
	planet24 - direction
	planet7 - direction
	phenomenon5 - direction
	image1 - mode
	phenomenon9 - direction
	infrared0 - mode
	spectrograph2 - mode
	planet6 - direction
	star1 - direction
	star3 - direction
	star8 - direction

	(:private
		satellite1 - satellite
		instrument2 - instrument
		instrument3 - instrument
	)
)
(:init
	(supports instrument2 spectrograph2)
	(calibration_target instrument2 star4)
	(supports instrument3 image1)
	(supports instrument3 spectrograph2)
	(calibration_target instrument3 groundstation2)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 star18)
)
(:goal
	(and
		(have_image phenomenon5 spectrograph2)
		(have_image planet6 spectrograph2)
		(have_image planet7 infrared0)
		(have_image phenomenon9 infrared0)
		(have_image phenomenon10 image1)
		(have_image planet11 image1)
		(have_image star12 thermograph3)
		(have_image star13 thermograph3)
		(have_image planet14 thermograph4)
		(have_image star15 thermograph4)
		(have_image phenomenon16 image1)
		(have_image planet17 thermograph3)
		(have_image star18 image1)
		(have_image planet20 image1)
		(have_image planet21 infrared0)
		(have_image planet22 image1)
		(have_image planet23 thermograph3)
		(have_image planet24 infrared0)
	)
)
)