(define (problem strips-sat-x-1) (:domain satellite)
(:objects
	planet15 - direction
	planet14 - direction
	planet17 - direction
	phenomenon40 - direction
	planet19 - direction
	phenomenon36 - direction
	phenomenon34 - direction
	phenomenon32 - direction
	star39 - direction
	star37 - direction
	phenomenon38 - direction
	planet48 - direction
	planet42 - direction
	planet43 - direction
	planet41 - direction
	planet46 - direction
	planet20 - direction
	star25 - direction
	star49 - direction
	phenomenon28 - direction
	star47 - direction
	star45 - direction
	star4 - direction
	star1 - direction
	star0 - direction
	star3 - direction
	star2 - direction
	star9 - direction
	planet33 - direction
	planet31 - direction
	planet35 - direction
	phenomenon18 - direction
	star16 - direction
	star10 - direction
	star13 - direction
	spectrograph2 - mode
	star50 - direction
	star52 - direction
	star29 - direction
	phenomenon6 - direction
	phenomenon7 - direction
	phenomenon5 - direction
	image1 - mode
	phenomenon8 - direction
	star21 - direction
	star22 - direction
	star23 - direction
	star24 - direction
	phenomenon30 - direction
	star26 - direction
	star27 - direction
	planet51 - direction
	star12 - direction
	infrared0 - mode
	phenomenon44 - direction
	phenomenon11 - direction

	(:private
		satellite5 - satellite
		instrument13 - instrument
		instrument14 - instrument
	)
)
(:init
	(supports instrument13 infrared0)
	(supports instrument13 spectrograph2)
	(supports instrument13 image1)
	(calibration_target instrument13 star2)
	(supports instrument14 spectrograph2)
	(supports instrument14 infrared0)
	(calibration_target instrument14 star1)
	(on_board instrument13 satellite5)
	(on_board instrument14 satellite5)
	(power_avail satellite5)
	(pointing satellite5 planet33)
)
(:goal
	(and
		(have_image star3 infrared0)
		(have_image star4 spectrograph2)
		(have_image phenomenon5 spectrograph2)
		(have_image phenomenon7 spectrograph2)
		(have_image phenomenon8 image1)
		(have_image star9 spectrograph2)
		(have_image star10 spectrograph2)
		(have_image phenomenon11 spectrograph2)
		(have_image star12 infrared0)
		(have_image star13 image1)
		(have_image planet14 image1)
		(have_image planet15 infrared0)
		(have_image star16 image1)
		(have_image planet17 spectrograph2)
		(have_image phenomenon18 image1)
		(have_image planet19 infrared0)
		(have_image planet20 image1)
		(have_image star21 spectrograph2)
		(have_image star22 image1)
		(have_image star23 image1)
		(have_image star24 image1)
		(have_image star25 infrared0)
		(have_image star26 spectrograph2)
		(have_image star27 infrared0)
		(have_image phenomenon28 spectrograph2)
		(have_image star29 spectrograph2)
		(have_image phenomenon30 image1)
		(have_image planet31 spectrograph2)
		(have_image phenomenon32 image1)
		(have_image planet33 infrared0)
		(have_image phenomenon34 infrared0)
		(have_image planet35 spectrograph2)
		(have_image phenomenon36 infrared0)
		(have_image star37 spectrograph2)
		(have_image star39 image1)
		(have_image phenomenon40 image1)
		(have_image planet41 image1)
		(have_image planet42 image1)
		(have_image planet43 image1)
		(have_image phenomenon44 image1)
		(have_image star45 image1)
		(have_image star47 spectrograph2)
		(have_image planet48 image1)
		(have_image star49 infrared0)
		(have_image star50 spectrograph2)
		(have_image planet51 image1)
		(have_image star52 image1)
	)
)
)