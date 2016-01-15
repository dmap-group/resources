(define (problem roverprob7126) (:domain rover)
(:objects
	camera3 - camera
	waypoint6 - waypoint
	rover3store - store
	low_res - mode
	waypoint5 - waypoint
	rover0store - store
	waypoint2 - waypoint
	waypoint0 - waypoint
	general - lander
	camera2 - camera
	waypoint1 - waypoint
	objective0 - objective
	colour - mode
	high_res - mode
	objective1 - objective
	camera1 - camera
	waypoint3 - waypoint
	objective2 - objective
	camera0 - camera
	rover2store - store
	waypoint7 - waypoint
	rover1store - store
	waypoint4 - waypoint

	(:private
		rover0 - rover
	)
)
(:init
	(visible waypoint0 waypoint4)
	(visible waypoint4 waypoint0)
	(visible waypoint0 waypoint7)
	(visible waypoint7 waypoint0)
	(visible waypoint1 waypoint0)
	(visible waypoint0 waypoint1)
	(visible waypoint1 waypoint5)
	(visible waypoint5 waypoint1)
	(visible waypoint1 waypoint7)
	(visible waypoint7 waypoint1)
	(visible waypoint2 waypoint1)
	(visible waypoint1 waypoint2)
	(visible waypoint3 waypoint0)
	(visible waypoint0 waypoint3)
	(visible waypoint3 waypoint1)
	(visible waypoint1 waypoint3)
	(visible waypoint3 waypoint2)
	(visible waypoint2 waypoint3)
	(visible waypoint3 waypoint6)
	(visible waypoint6 waypoint3)
	(visible waypoint4 waypoint1)
	(visible waypoint1 waypoint4)
	(visible waypoint4 waypoint5)
	(visible waypoint5 waypoint4)
	(visible waypoint5 waypoint2)
	(visible waypoint2 waypoint5)
	(visible waypoint5 waypoint3)
	(visible waypoint3 waypoint5)
	(visible waypoint5 waypoint6)
	(visible waypoint6 waypoint5)
	(visible waypoint6 waypoint0)
	(visible waypoint0 waypoint6)
	(visible waypoint6 waypoint2)
	(visible waypoint2 waypoint6)
	(visible waypoint6 waypoint4)
	(visible waypoint4 waypoint6)
	(visible waypoint7 waypoint2)
	(visible waypoint2 waypoint7)
	(visible waypoint7 waypoint3)
	(visible waypoint3 waypoint7)
	(visible waypoint7 waypoint5)
	(visible waypoint5 waypoint7)
	(at_soil_sample waypoint0)
	(at_rock_sample waypoint0)
	(at_soil_sample waypoint1)
	(at_rock_sample waypoint1)
	(at_rock_sample waypoint2)
	(at_soil_sample waypoint3)
	(at_rock_sample waypoint4)
	(at_soil_sample waypoint6)
	(at_rock_sample waypoint6)
	(at_rock_sample waypoint7)
	(at_lander general waypoint1)
	(channel_free general)
	(at rover0 waypoint1)
	(available rover0)
	(store_of rover0store rover0)
	(empty rover0store)
	(equipped_for_soil_analysis rover0)
	(equipped_for_imaging rover0)
	(can_traverse rover0 waypoint1 waypoint0)
	(can_traverse rover0 waypoint0 waypoint1)
	(can_traverse rover0 waypoint1 waypoint3)
	(can_traverse rover0 waypoint3 waypoint1)
	(can_traverse rover0 waypoint1 waypoint4)
	(can_traverse rover0 waypoint4 waypoint1)
	(can_traverse rover0 waypoint1 waypoint5)
	(can_traverse rover0 waypoint5 waypoint1)
	(can_traverse rover0 waypoint0 waypoint6)
	(can_traverse rover0 waypoint6 waypoint0)
	(can_traverse rover0 waypoint0 waypoint7)
	(can_traverse rover0 waypoint7 waypoint0)
	(can_traverse rover0 waypoint3 waypoint2)
	(can_traverse rover0 waypoint2 waypoint3)
	(empty rover1store)
	(empty rover2store)
	(empty rover3store)
	(calibration_target camera0 objective1)
	(supports camera0 high_res)
	(supports camera0 low_res)
	(calibration_target camera1 objective0)
	(supports camera1 colour)
	(supports camera1 high_res)
	(calibration_target camera2 objective0)
	(supports camera2 high_res)
	(on_board camera3 rover0)
	(calibration_target camera3 objective1)
	(supports camera3 colour)
	(visible_from objective0 waypoint0)
	(visible_from objective0 waypoint1)
	(visible_from objective0 waypoint2)
	(visible_from objective0 waypoint3)
	(visible_from objective0 waypoint4)
	(visible_from objective0 waypoint5)
	(visible_from objective1 waypoint0)
	(visible_from objective1 waypoint1)
	(visible_from objective1 waypoint2)
	(visible_from objective2 waypoint0)
	(visible_from objective2 waypoint1)
	(visible_from objective2 waypoint2)
	(visible_from objective2 waypoint3)
	(visible_from objective2 waypoint4)
	(visible_from objective2 waypoint5)
	(visible_from objective2 waypoint6)
)
(:goal
	(and
		(communicated_soil_data waypoint6)
		(communicated_soil_data waypoint0)
		(communicated_soil_data waypoint1)
		(communicated_soil_data waypoint3)
		(communicated_rock_data waypoint6)
		(communicated_rock_data waypoint0)
		(communicated_rock_data waypoint4)
		(communicated_rock_data waypoint7)
		(communicated_image_data objective1 high_res)
	)
)
)