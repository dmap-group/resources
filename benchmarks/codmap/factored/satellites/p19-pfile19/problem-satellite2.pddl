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
		instrument8 - instrument
		instrument9 - instrument
		satellite2 - satellite
		instrument10 - instrument
		instrument11 - instrument
		instrument12 - instrument
		instrument13 - instrument
	)
)
(:init
	(supports instrument8 infrared3)
	(supports instrument8 infrared7)
	(calibration_target instrument8 star1)
	(supports instrument9 spectrograph0)
	(calibration_target instrument9 star3)
	(supports instrument10 image4)
	(supports instrument10 infrared7)
	(supports instrument10 image5)
	(calibration_target instrument10 groundstation4)
	(supports instrument11 infrared2)
	(calibration_target instrument11 star2)
	(supports instrument12 thermograph1)
	(calibration_target instrument12 star3)
	(supports instrument13 infrared3)
	(calibration_target instrument13 star2)
	(on_board instrument8 satellite2)
	(on_board instrument9 satellite2)
	(on_board instrument10 satellite2)
	(on_board instrument11 satellite2)
	(on_board instrument12 satellite2)
	(on_board instrument13 satellite2)
	(power_avail satellite2)
	(pointing satellite2 phenomenon5)
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