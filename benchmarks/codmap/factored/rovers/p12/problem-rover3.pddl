(define (problem truck-crane-p1) (:domain rover)
(:objects
	camera1 - camera
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
	colour - mode
	objective3 - objective
	high_res - mode
	objective1 - objective
	objective0 - objective
	waypoint3 - waypoint
	objective2 - objective
	camera0 - camera
	rover2store - store
	waypoint7 - waypoint
	rover1store - store
	waypoint4 - waypoint

	(:private
		rover3 - rover
	)
)
(:init
	(visible waypoint0 waypoint1)
	(visible waypoint1 waypoint0)
	(visible waypoint0 waypoint3)
	(visible waypoint3 waypoint0)
	(visible waypoint0 waypoint5)
	(visible waypoint5 waypoint0)
	(visible waypoint0 waypoint6)
	(visible waypoint6 waypoint0)
	(visible waypoint0 waypoint7)
	(visible waypoint7 waypoint0)
	(visible waypoint1 waypoint5)
	(visible waypoint5 waypoint1)
	(visible waypoint1 waypoint7)
	(visible waypoint7 waypoint1)
	(visible waypoint2 waypoint0)
	(visible waypoint0 waypoint2)
	(visible waypoint2 waypoint5)
	(visible waypoint5 waypoint2)
	(visible waypoint3 waypoint2)
	(visible waypoint2 waypoint3)
	(visible waypoint3 waypoint7)
	(visible waypoint7 waypoint3)
	(visible waypoint4 waypoint2)
	(visible waypoint2 waypoint4)
	(visible waypoint4 waypoint5)
	(visible waypoint5 waypoint4)
	(visible waypoint4 waypoint6)
	(visible waypoint6 waypoint4)
	(visible waypoint5 waypoint3)
	(visible waypoint3 waypoint5)
	(visible waypoint6 waypoint5)
	(visible waypoint5 waypoint6)
	(visible waypoint6 waypoint7)
	(visible waypoint7 waypoint6)
	(visible waypoint7 waypoint2)
	(visible waypoint2 waypoint7)
	(visible waypoint7 waypoint4)
	(visible waypoint4 waypoint7)
	(visible waypoint7 waypoint5)
	(visible waypoint5 waypoint7)
	(at_soil_sample waypoint0)
	(at_rock_sample waypoint0)
	(at_rock_sample waypoint2)
	(at_rock_sample waypoint3)
	(at_rock_sample waypoint5)
	(at_rock_sample waypoint6)
	(at_rock_sample waypoint7)
	(at_lander general waypoint2)
	(channel_free general)
	(empty rover0store)
	(empty rover1store)
	(empty rover2store)
	(at rover3 waypoint7)
	(available rover3)
	(store_of rover3store rover3)
	(empty rover3store)
	(equipped_for_soil_analysis rover3)
	(equipped_for_rock_analysis rover3)
	(equipped_for_imaging rover3)
	(can_traverse rover3 waypoint7 waypoint0)
	(can_traverse rover3 waypoint0 waypoint7)
	(can_traverse rover3 waypoint7 waypoint1)
	(can_traverse rover3 waypoint1 waypoint7)
	(can_traverse rover3 waypoint7 waypoint2)
	(can_traverse rover3 waypoint2 waypoint7)
	(can_traverse rover3 waypoint7 waypoint3)
	(can_traverse rover3 waypoint3 waypoint7)
	(can_traverse rover3 waypoint7 waypoint4)
	(can_traverse rover3 waypoint4 waypoint7)
	(can_traverse rover3 waypoint7 waypoint5)
	(can_traverse rover3 waypoint5 waypoint7)
	(can_traverse rover3 waypoint0 waypoint6)
	(can_traverse rover3 waypoint6 waypoint0)
	(on_board camera0 rover3)
	(calibration_target camera0 objective2)
	(supports camera0 high_res)
	(calibration_target camera1 objective1)
	(supports camera1 high_res)
	(calibration_target camera2 objective0)
	(supports camera2 low_res)
	(on_board camera3 rover3)
	(calibration_target camera3 objective3)
	(supports camera3 colour)
	(supports camera3 high_res)
	(supports camera3 low_res)
	(visible_from objective0 waypoint0)
	(visible_from objective0 waypoint1)
	(visible_from objective0 waypoint2)
	(visible_from objective1 waypoint0)
	(visible_from objective1 waypoint1)
	(visible_from objective1 waypoint2)
	(visible_from objective1 waypoint3)
	(visible_from objective2 waypoint0)
	(visible_from objective2 waypoint1)
	(visible_from objective2 waypoint2)
	(visible_from objective2 waypoint3)
	(visible_from objective2 waypoint4)
	(visible_from objective3 waypoint0)
	(visible_from objective3 waypoint1)
	(visible_from objective3 waypoint2)
	(visible_from objective3 waypoint3)
	(visible_from objective3 waypoint4)
	(visible_from objective3 waypoint5)
)
(:goal
	(and
		(communicated_soil_data waypoint0)
		(communicated_rock_data waypoint3)
		(communicated_rock_data waypoint6)
		(communicated_image_data objective2 low_res)
		(communicated_image_data objective1 high_res)
		(communicated_image_data objective3 low_res)
	)
)
)