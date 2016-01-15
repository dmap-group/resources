(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet13 - direction
	planet14 - direction
	infrared1 - mode
	planet16 - direction
	planet19 - direction
	spectrograph4 - mode
	phenomenon15 - direction
	phenomenon7 - direction
	planet6 - direction
	image3 - mode
	star17 - direction
	star11 - direction
	star10 - direction
	star12 - direction
	thermograph2 - mode
	infrared0 - mode
	star18 - direction
	star5 - direction
	star4 - direction
	star1 - direction
	star0 - direction
	star2 - direction
	phenomenon9 - direction
	groundstation3 - direction
	star8 - direction

	(:private
		satellite3 - satellite
		instrument7 - instrument
	)
)
(:init
	(supports instrument7 image3)
	(calibration_target instrument7 star2)
	(on_board instrument7 satellite3)
	(power_avail satellite3)
	(pointing satellite3 phenomenon9)
)
(:goal
	(and
		(have_image star5 image3)
		(have_image planet6 infrared1)
		(have_image phenomenon7 infrared1)
		(have_image star8 image3)
		(have_image star10 thermograph2)
		(have_image star11 infrared1)
		(have_image planet13 spectrograph4)
		(have_image planet14 thermograph2)
		(have_image phenomenon15 infrared0)
		(have_image planet16 image3)
		(have_image star17 infrared0)
	)
)
)