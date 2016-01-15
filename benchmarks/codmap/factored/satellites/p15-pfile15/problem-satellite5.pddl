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
		satellite5 - satellite
		instrument10 - instrument
		instrument11 - instrument
		instrument12 - instrument
	)
)
(:init
	(supports instrument10 thermograph4)
	(supports instrument10 spectrograph2)
	(supports instrument10 infrared0)
	(calibration_target instrument10 groundstation0)
	(supports instrument11 infrared0)
	(calibration_target instrument11 groundstation0)
	(supports instrument12 infrared0)
	(calibration_target instrument12 star1)
	(on_board instrument10 satellite5)
	(on_board instrument11 satellite5)
	(on_board instrument12 satellite5)
	(power_avail satellite5)
	(pointing satellite5 planet6)
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