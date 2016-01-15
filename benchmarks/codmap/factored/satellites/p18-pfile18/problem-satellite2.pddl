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
		satellite2 - satellite
		instrument8 - instrument
		instrument9 - instrument
		instrument7 - instrument
	)
)
(:init
	(supports instrument7 thermograph0)
	(calibration_target instrument7 star3)
	(supports instrument8 thermograph4)
	(supports instrument8 thermograph3)
	(supports instrument8 thermograph2)
	(calibration_target instrument8 star3)
	(supports instrument9 thermograph2)
	(supports instrument9 thermograph3)
	(calibration_target instrument9 star1)
	(on_board instrument7 satellite2)
	(on_board instrument8 satellite2)
	(on_board instrument9 satellite2)
	(power_avail satellite2)
	(pointing satellite2 star4)
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