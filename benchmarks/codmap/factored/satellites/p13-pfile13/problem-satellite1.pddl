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
		satellite1 - satellite
		instrument2 - instrument
	)
)
(:init
	(supports instrument2 thermograph0)
	(supports instrument2 image4)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 groundstation3)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 planet17)
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