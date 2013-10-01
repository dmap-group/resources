(define (problem roverprob1234)
(:domain rover-uncoord)
(:requirements :typing)
(:objects
    general - Lander
    colour - Mode
    highres - Mode
    lowres - Mode
    rover0 - Rover
    rover0store - Store
    rover1 - Rover
    rover1store - Store
    waypoint0 - Waypoint
    waypoint1 - Waypoint
    waypoint2 - Waypoint
    waypoint3 - Waypoint
    waypoint4 - Waypoint
    waypoint5 - Waypoint
    waypoint6 - Waypoint
    waypoint7 - Waypoint
    camera0 - Camera
    camera1 - Camera
    objective0 - Objective
    objective1 - Objective
    objective2 - Objective
    objective3 - Objective
    )
(:init
    (channel_free general)

    (visible waypoint1 waypoint0)
    (visible waypoint0 waypoint1)
    (visible waypoint2 waypoint0)
    (visible waypoint0 waypoint2)
    (visible waypoint2 waypoint1)
    (visible waypoint1 waypoint2)
    (visible waypoint3 waypoint0)
    (visible waypoint0 waypoint3)
    (visible waypoint3 waypoint1)
    (visible waypoint1 waypoint3)
    (visible waypoint3 waypoint2)
    (visible waypoint2 waypoint3)
    (at_soil_sample waypoint0)
    (at_rock_sample waypoint1)
    (at_soil_sample waypoint2)
    (at_rock_sample waypoint2)
    (at_soil_sample waypoint3)
    (at_rock_sample waypoint3)
    (at rover0 waypoint3)
    (available rover0)
    (store_of rover0store rover0)
    (empty rover0store)
    (equipped_for_soil_analysis rover0)
    (equipped_for_rock_analysis rover0)
    (equipped_for_imaging rover0)
    (can_traverse rover0 waypoint3 waypoint0)
    (can_traverse rover0 waypoint0 waypoint3)
    (can_traverse rover0 waypoint3 waypoint1)
    (can_traverse rover0 waypoint1 waypoint3)
    (can_traverse rover0 waypoint1 waypoint2)
    (can_traverse rover0 waypoint2 waypoint1)
    (on_board camera0 rover0)
    (calibration_target camera0 objective1)
    (supports camera0 colour)
    (supports camera0 highres)
    (visible_from objective0 waypoint0)
    (visible_from objective0 waypoint1)
    (visible_from objective0 waypoint2)
    (visible_from objective0 waypoint3)
    (visible_from objective1 waypoint0)
    (visible_from objective1 waypoint1)
    (visible_from objective1 waypoint2)
    (visible_from objective1 waypoint3)

    (visible waypoint5 waypoint4)
    (visible waypoint4 waypoint5)
    (visible waypoint6 waypoint4)
    (visible waypoint4 waypoint6)
    (visible waypoint6 waypoint5)
    (visible waypoint5 waypoint6)
    (visible waypoint7 waypoint4)
    (visible waypoint4 waypoint7)
    (visible waypoint7 waypoint5)
    (visible waypoint5 waypoint7)
    (visible waypoint7 waypoint6)
    (visible waypoint6 waypoint7)
    (at_soil_sample waypoint4)
    (at_rock_sample waypoint5)
    (at_soil_sample waypoint6)
    (at_rock_sample waypoint6)
    (at_soil_sample waypoint7)
    (at_rock_sample waypoint7)
    (at rover1 waypoint7)
    (available rover1)
    (store_of rover1store rover1)
    (empty rover1store)
    (equipped_for_soil_analysis rover1)
    (equipped_for_rock_analysis rover1)
    (equipped_for_imaging rover1)
    (can_traverse rover1 waypoint7 waypoint4)
    (can_traverse rover1 waypoint4 waypoint7)
    (can_traverse rover1 waypoint7 waypoint5)
    (can_traverse rover1 waypoint5 waypoint7)
    (can_traverse rover1 waypoint5 waypoint6)
    (can_traverse rover1 waypoint6 waypoint5)
    (on_board camera1 rover1)
    (calibration_target camera1 objective3)
    (supports camera1 colour)
    (supports camera1 highres)
    (visible_from objective2 waypoint4)
    (visible_from objective2 waypoint5)
    (visible_from objective2 waypoint6)
    (visible_from objective2 waypoint7)
    (visible_from objective3 waypoint4)
    (visible_from objective3 waypoint5)
    (visible_from objective3 waypoint6)
    (visible_from objective3 waypoint7)
)

(:goal (and
    (communicated waypoint2 waypoint3 objective1 highres)
    (communicated waypoint6 waypoint7 objective3 highres)
    )
)
)
