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
		satellite1 - satellite
		instrument2 - instrument
		instrument3 - instrument
		instrument1 - instrument
	)
)
(:init
	(supports instrument1 infrared0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 groundstation3)
	(supports instrument2 infrared1)
	(supports instrument2 infrared0)
	(calibration_target instrument2 star2)
	(supports instrument3 spectrograph4)
	(supports instrument3 infrared1)
	(supports instrument3 thermograph2)
	(calibration_target instrument3 star0)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 groundstation3)
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