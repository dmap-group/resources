(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet15 - direction
	planet17 - direction
	star14 - direction
	star16 - direction
	star10 - direction
	star12 - direction
	thermograph1 - mode
	phenomenon11 - direction
	phenomenon13 - direction
	star19 - direction
	star18 - direction
	star6 - direction
	phenomenon8 - direction
	groundstation4 - direction
	groundstation0 - direction
	planet21 - direction
	planet22 - direction
	phenomenon7 - direction
	phenomenon5 - direction
	planet9 - direction
	image5 - mode
	image4 - mode
	phenomenon20 - direction
	star23 - direction
	phenomenon24 - direction
	infrared7 - mode
	infrared2 - mode
	infrared3 - mode
	spectrograph0 - mode
	star1 - direction
	spectrograph6 - mode
	star3 - direction
	star2 - direction

	(:private
		satellite0 - satellite
		instrument2 - instrument
		instrument0 - instrument
		instrument1 - instrument
	)
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 image4)
	(calibration_target instrument0 groundstation0)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 star3)
	(supports instrument2 infrared3)
	(supports instrument2 thermograph1)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 planet21)
)
(:goal
	(and
		(have_image phenomenon5 infrared7)
		(have_image phenomenon5 image4)
		(have_image phenomenon7 thermograph1)
		(have_image planet9 spectrograph0)
		(have_image planet9 spectrograph6)
		(have_image star10 infrared3)
		(have_image star10 spectrograph6)
		(have_image phenomenon11 infrared2)
		(have_image star12 spectrograph6)
		(have_image star12 thermograph1)
		(have_image phenomenon13 infrared7)
		(have_image phenomenon13 infrared2)
		(have_image star14 infrared2)
		(have_image planet15 infrared2)
		(have_image star16 image4)
		(have_image planet17 image5)
		(have_image planet17 image4)
		(have_image star18 infrared2)
		(have_image star19 infrared3)
		(have_image star19 thermograph1)
		(have_image phenomenon20 spectrograph0)
		(have_image planet21 infrared3)
		(have_image planet21 image5)
		(have_image planet22 infrared2)
		(have_image star23 infrared2)
		(have_image phenomenon24 spectrograph6)
		(have_image phenomenon24 image5)
	)
)
)