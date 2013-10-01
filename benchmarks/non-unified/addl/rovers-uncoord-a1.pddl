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
    waypoint0 - Waypoint
    waypoint1 - Waypoint
    waypoint2 - Waypoint
    waypoint3 - Waypoint
    camera0 - Camera
    objective0 - Objective
    objective1 - Objective
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
)

(:goal (and
    (communicated waypoint2 waypoint3 objective1 highres)
    )
)
)
