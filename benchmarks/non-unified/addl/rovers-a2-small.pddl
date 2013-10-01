(define (problem roverprob1234)
(:domain Rover)
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
    waypoint2 - Waypoint
    waypoint3 - Waypoint
    waypoint6 - Waypoint
    waypoint7 - Waypoint
    camera0 - Camera
    camera1 - Camera
    objective1 - Objective
    objective3 - Objective
    )
(:init
    (channel_free general)

    (visible waypoint3 waypoint2)
    (visible waypoint2 waypoint3)
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
    (can_traverse rover0 waypoint3 waypoint2)
    (can_traverse rover0 waypoint2 waypoint3)
    (on_board camera0 rover0)
    (calibration_target camera0 objective1)
    (supports camera0 colour)
    (supports camera0 highres)
    (visible_from objective1 waypoint2)
    (visible_from objective1 waypoint3)


    (visible waypoint7 waypoint6)
    (visible waypoint6 waypoint7)
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
    (can_traverse rover1 waypoint6 waypoint7)
    (can_traverse rover1 waypoint7 waypoint6)
    (on_board camera1 rover1)
    (calibration_target camera1 objective3)
    (supports camera1 colour)
    (supports camera1 highres)
    (visible_from objective3 waypoint6)
    (visible_from objective3 waypoint7)
)

(:goal (and
    (communicated waypoint2 waypoint3 objective1 highres)
    (communicated waypoint6 waypoint7 objective3 highres)
    )
)
)
