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
		satellite2 - satellite
		instrument6 - instrument
		instrument4 - instrument
		instrument5 - instrument
	)
)
(:init
	(supports instrument4 infrared1)
	(supports instrument4 image3)
	(supports instrument4 infrared0)
	(calibration_target instrument4 star2)
	(supports instrument5 thermograph2)
	(supports instrument5 spectrograph4)
	(calibration_target instrument5 star0)
	(supports instrument6 infrared0)
	(calibration_target instrument6 groundstation3)
	(on_board instrument4 satellite2)
	(on_board instrument5 satellite2)
	(on_board instrument6 satellite2)
	(power_avail satellite2)
	(pointing satellite2 star4)
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