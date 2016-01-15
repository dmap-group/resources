(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet15 - direction
	planet17 - direction
	planet16 - direction
	phenomenon18 - direction
	star14 - direction
	star10 - direction
	thermograph0 - mode
	phenomenon12 - direction
	phenomenon13 - direction
	star19 - direction
	thermograph4 - mode
	groundstation4 - direction
	groundstation3 - direction
	groundstation2 - direction
	groundstation1 - direction
	groundstation0 - direction
	planet21 - direction
	planet23 - direction
	phenomenon6 - direction
	phenomenon7 - direction
	phenomenon5 - direction
	image2 - mode
	image1 - mode
	planet8 - direction
	star20 - direction
	star22 - direction
	star24 - direction
	phenomenon11 - direction
	star9 - direction
	thermograph3 - mode

	(:private
		instrument3 - instrument
		satellite1 - satellite
	)
)
(:init
	(supports instrument3 thermograph0)
	(supports instrument3 thermograph4)
	(supports instrument3 image2)
	(calibration_target instrument3 groundstation2)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 groundstation1)
)
(:goal
	(and
		(have_image phenomenon5 image1)
		(have_image phenomenon7 thermograph0)
		(have_image planet8 image2)
		(have_image star9 thermograph0)
		(have_image star10 thermograph3)
		(have_image phenomenon12 thermograph0)
		(have_image phenomenon13 image1)
		(have_image star14 thermograph4)
		(have_image planet15 image2)
		(have_image planet17 image2)
		(have_image phenomenon18 image1)
		(have_image star19 thermograph4)
		(have_image star20 thermograph4)
		(have_image planet21 thermograph0)
		(have_image star22 thermograph3)
		(have_image planet23 image1)
	)
)
)