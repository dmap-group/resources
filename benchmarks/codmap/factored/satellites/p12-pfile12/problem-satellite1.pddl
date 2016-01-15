(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet11 - direction
	planet10 - direction
	phenomenon13 - direction
	planet16 - direction
	planet20 - direction
	infrared0 - mode
	spectrograph4 - mode
	infrared1 - mode
	planet5 - direction
	phenomenon6 - direction
	phenomenon21 - direction
	infrared3 - mode
	planet8 - direction
	star15 - direction
	star14 - direction
	star22 - direction
	star23 - direction
	phenomenon24 - direction
	star12 - direction
	thermograph2 - mode
	star19 - direction
	star18 - direction
	phenomenon17 - direction
	star4 - direction
	star7 - direction
	star0 - direction
	star3 - direction
	star2 - direction
	star9 - direction
	groundstation1 - direction

	(:private
		instrument3 - instrument
		satellite1 - satellite
		instrument4 - instrument
	)
)
(:init
	(supports instrument3 infrared0)
	(supports instrument3 spectrograph4)
	(calibration_target instrument3 star4)
	(supports instrument4 infrared0)
	(supports instrument4 infrared3)
	(supports instrument4 thermograph2)
	(calibration_target instrument4 star4)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 star4)
)
(:goal
	(and
		(have_image planet5 infrared0)
		(have_image phenomenon6 spectrograph4)
		(have_image star7 infrared0)
		(have_image planet8 infrared1)
		(have_image star9 spectrograph4)
		(have_image planet10 thermograph2)
		(have_image planet11 infrared3)
		(have_image phenomenon13 spectrograph4)
		(have_image star14 thermograph2)
		(have_image star15 infrared3)
		(have_image planet16 infrared1)
		(have_image phenomenon17 spectrograph4)
		(have_image star18 spectrograph4)
		(have_image star19 thermograph2)
		(have_image planet20 thermograph2)
		(have_image phenomenon21 thermograph2)
		(have_image star22 infrared1)
		(have_image star23 spectrograph4)
		(have_image phenomenon24 infrared0)
	)
)
)