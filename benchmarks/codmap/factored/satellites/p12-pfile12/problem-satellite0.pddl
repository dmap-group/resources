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
		instrument2 - instrument
		instrument0 - instrument
		satellite0 - satellite
		instrument1 - instrument
	)
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph4)
	(calibration_target instrument0 star0)
	(supports instrument1 infrared1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 star2)
	(supports instrument2 infrared1)
	(supports instrument2 infrared0)
	(calibration_target instrument2 star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 planet16)
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