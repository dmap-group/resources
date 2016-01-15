(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet11 - direction
	planet10 - direction
	planet13 - direction
	planet15 - direction
	planet17 - direction
	planet16 - direction
	phenomenon18 - direction
	star14 - direction
	thermograph1 - mode
	thermograph0 - mode
	phenomenon12 - direction
	thermograph2 - mode
	star19 - direction
	groundstation3 - direction
	groundstation2 - direction
	planet28 - direction
	planet29 - direction
	planet20 - direction
	planet23 - direction
	planet24 - direction
	planet25 - direction
	planet7 - direction
	phenomenon5 - direction
	image3 - mode
	planet9 - direction
	planet8 - direction
	image4 - mode
	star21 - direction
	star22 - direction
	star26 - direction
	phenomenon27 - direction
	star4 - direction
	planet6 - direction
	star1 - direction
	star0 - direction

	(:private
		satellite4 - satellite
		instrument8 - instrument
		instrument6 - instrument
		instrument7 - instrument
	)
)
(:init
	(supports instrument6 image3)
	(supports instrument6 thermograph1)
	(supports instrument6 thermograph0)
	(calibration_target instrument6 star4)
	(supports instrument7 thermograph2)
	(supports instrument7 thermograph0)
	(calibration_target instrument7 star0)
	(supports instrument8 image3)
	(supports instrument8 thermograph2)
	(calibration_target instrument8 groundstation3)
	(on_board instrument6 satellite4)
	(on_board instrument7 satellite4)
	(on_board instrument8 satellite4)
	(power_avail satellite4)
	(pointing satellite4 phenomenon5)
)
(:goal
	(and
		(have_image phenomenon5 thermograph1)
		(have_image planet6 image4)
		(have_image planet7 image3)
		(have_image planet8 image3)
		(have_image planet9 thermograph0)
		(have_image planet10 thermograph1)
		(have_image planet11 thermograph2)
		(have_image phenomenon12 image3)
		(have_image planet13 thermograph1)
		(have_image star14 image3)
		(have_image planet15 thermograph0)
		(have_image planet16 image3)
		(have_image planet17 image4)
		(have_image phenomenon18 image3)
		(have_image star19 thermograph0)
		(have_image star21 thermograph1)
		(have_image star22 image4)
		(have_image planet23 thermograph1)
		(have_image planet24 thermograph2)
		(have_image planet25 thermograph1)
		(have_image star26 thermograph0)
		(have_image phenomenon27 thermograph1)
		(have_image planet28 thermograph2)
		(have_image planet29 thermograph0)
	)
)
)