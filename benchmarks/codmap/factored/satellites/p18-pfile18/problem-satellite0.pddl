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
		instrument2 - instrument
		instrument1 - instrument
		satellite0 - satellite
		instrument0 - instrument
	)
)
(:init
	(supports instrument0 thermograph4)
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 star4)
	(supports instrument1 thermograph3)
	(calibration_target instrument1 star0)
	(supports instrument2 image1)
	(calibration_target instrument2 star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 star8)
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