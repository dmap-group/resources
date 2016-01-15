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
		satellite3 - satellite
		instrument21 - instrument
		instrument20 - instrument
		instrument15 - instrument
		instrument14 - instrument
		instrument18 - instrument
		instrument16 - instrument
		instrument17 - instrument
		instrument19 - instrument
	)
)
(:init
	(supports instrument14 thermograph1)
	(supports instrument14 infrared2)
	(calibration_target instrument14 groundstation4)
	(supports instrument15 infrared2)
	(calibration_target instrument15 star1)
	(supports instrument16 image4)
	(supports instrument16 spectrograph6)
	(calibration_target instrument16 star2)
	(supports instrument17 image4)
	(supports instrument17 infrared7)
	(supports instrument17 image5)
	(calibration_target instrument17 groundstation0)
	(supports instrument18 image4)
	(supports instrument18 spectrograph6)
	(calibration_target instrument18 star2)
	(supports instrument19 infrared3)
	(supports instrument19 infrared7)
	(supports instrument19 spectrograph6)
	(calibration_target instrument19 star3)
	(supports instrument20 infrared3)
	(supports instrument20 infrared2)
	(calibration_target instrument20 star2)
	(supports instrument21 infrared2)
	(supports instrument21 thermograph1)
	(calibration_target instrument21 groundstation4)
	(on_board instrument14 satellite3)
	(on_board instrument15 satellite3)
	(on_board instrument16 satellite3)
	(on_board instrument17 satellite3)
	(on_board instrument18 satellite3)
	(on_board instrument19 satellite3)
	(on_board instrument20 satellite3)
	(on_board instrument21 satellite3)
	(power_avail satellite3)
	(pointing satellite3 phenomenon20)
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