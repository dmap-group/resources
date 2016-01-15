(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet11 - direction
	star15 - direction
	phenomenon13 - direction
	planet14 - direction
	planet19 - direction
	planet23 - direction
	star8 - direction
	groundstation2 - direction
	phenomenon5 - direction
	image1 - mode
	phenomenon24 - direction
	phenomenon18 - direction
	phenomenon21 - direction
	star22 - direction
	star10 - direction
	star4 - direction
	thermograph0 - mode
	thermograph3 - mode
	thermograph2 - mode
	thermograph4 - mode
	phenomenon16 - direction
	phenomenon17 - direction
	planet20 - direction
	planet6 - direction
	planet7 - direction
	star0 - direction
	star3 - direction
	star1 - direction
	star9 - direction
	phenomenon12 - direction

	(:private
		instrument3 - instrument
		satellite1 - satellite
		instrument6 - instrument
		instrument4 - instrument
		instrument5 - instrument
	)
)
(:init
	(supports instrument3 thermograph3)
	(calibration_target instrument3 star1)
	(supports instrument4 image1)
	(calibration_target instrument4 star1)
	(supports instrument5 thermograph3)
	(calibration_target instrument5 star3)
	(supports instrument6 thermograph2)
	(supports instrument6 thermograph0)
	(supports instrument6 image1)
	(calibration_target instrument6 star0)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(on_board instrument6 satellite1)
	(power_avail satellite1)
	(pointing satellite1 phenomenon21)
)
(:goal
	(and
		(have_image phenomenon5 thermograph4)
		(have_image planet7 image1)
		(have_image star8 thermograph3)
		(have_image star9 image1)
		(have_image star10 image1)
		(have_image phenomenon13 thermograph2)
		(have_image star15 thermograph2)
		(have_image phenomenon17 thermograph4)
		(have_image phenomenon18 image1)
		(have_image planet19 thermograph2)
		(have_image planet20 thermograph4)
		(have_image phenomenon21 image1)
		(have_image star22 thermograph3)
	)
)
)