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
		instrument12 - instrument
		satellite4 - satellite
	)
)
(:init
	(supports instrument12 thermograph4)
	(calibration_target instrument12 star3)
	(on_board instrument12 satellite4)
	(power_avail satellite4)
	(pointing satellite4 phenomenon18)
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