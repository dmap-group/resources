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
		satellite2 - satellite
		instrument6 - instrument
		instrument7 - instrument
		instrument5 - instrument
	)
)
(:init
	(supports instrument5 image1)
	(supports instrument5 infrared0)
	(calibration_target instrument5 star0)
	(supports instrument6 infrared0)
	(supports instrument6 spectrograph2)
	(supports instrument6 image1)
	(calibration_target instrument6 star1)
	(supports instrument7 spectrograph2)
	(supports instrument7 infrared0)
	(calibration_target instrument7 star1)
	(on_board instrument5 satellite2)
	(on_board instrument6 satellite2)
	(on_board instrument7 satellite2)
	(power_avail satellite2)
	(pointing satellite2 planet14)
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