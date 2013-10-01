(define (domain Rover)
(:requirements :strips :typing)
(:types rover waypoint store camera mode lander objective - object)
(:predicates (at ?x - rover ?y - waypoint) 
		 (can_traverse ?r - rover ?x - waypoint ?y - waypoint)
	     (equipped_for_soil_analysis ?r - rover)
		 (equipped_for_rock_analysis ?r - rover)
		 (equipped_for_imaging ?r - rover)
		 (empty ?s - store)
		 (have_rock_analysis ?r - rover ?w - waypoint)
		 (have_soil_analysis ?r - rover ?w - waypoint)
		 (full ?s - store)
	     (calibrated ?c - camera ?r - rover) 
	     (supports ?c - camera ?m - mode)
		 (available ?r - rover)
		 (visible ?w - waypoint ?p - waypoint)
		 (have_image ?r - rover ?o - objective ?m - mode)
		 (communicated ?psoil - waypoint ?prock - waypoint ?o - objective ?m - mode)
	     (at_soil_sample ?w - waypoint)
	     (at_rock_sample ?w - waypoint)
         (visible_from ?o - objective ?w - waypoint)
	     (store_of ?s - store ?r - rover)
	     (calibration_target ?i - camera ?o - objective)
	     (on_board ?i - camera ?r - rover)
	     (channel_free ?l - lander)
		 (ready_soil_data ?r - rover ?p - waypoint)
		 (ready_rock_data ?r - rover ?p - waypoint)
		 (ready_image_data ?r - rover ?o - objective ?m - mode)

)

	
(:action navigate
:parameters (?x - rover ?y - waypoint ?z - waypoint) 
:precondition (and (can_traverse ?x ?y ?z) (available ?x) (at ?x ?y) 
                (visible ?y ?z)
	    )
:effect (and (not (at ?x ?y)) (at ?x ?z)
		)
)

(:action sample_soil
:parameters (?x - rover ?s - store ?p - waypoint)
:precondition (and (at ?x ?p) (at_soil_sample ?p) (equipped_for_soil_analysis ?x) (store_of ?s ?x) (empty ?s)
		)
:effect (and (not (empty ?s)) (full ?s) (have_soil_analysis ?x ?p) (not (at_soil_sample ?p))
		)
)

(:action sample_rock
:parameters (?x - rover ?s - store ?p - waypoint)
:precondition (and (at ?x ?p) (at_rock_sample ?p) (equipped_for_rock_analysis ?x) (store_of ?s ?x)(empty ?s)
		)
:effect (and (not (empty ?s)) (full ?s) (have_rock_analysis ?x ?p) (not (at_rock_sample ?p))
		)
)

(:action drop
:parameters (?x - rover ?y - store)
:precondition (and (store_of ?y ?x) (full ?y)
		)
:effect (and (not (full ?y)) (empty ?y)
	)
)

(:action calibrate
 :parameters (?r - rover ?i - camera ?t - objective ?w - waypoint)
 :precondition (and (equipped_for_imaging ?r) (calibration_target ?i ?t) (at ?r ?w) (visible_from ?t ?w)(on_board ?i ?r)
		)
 :effect (calibrated ?i ?r) 
)




(:action take_image
 :parameters (?r - rover ?p - waypoint ?o - objective ?i - camera ?m - mode)
 :precondition (and (calibrated ?i ?r)
			 (on_board ?i ?r)
                      (equipped_for_imaging ?r)
                      (supports ?i ?m)
			  (visible_from ?o ?p)
                     (at ?r ?p)
               )
 :effect (and (have_image ?r ?o ?m)(not (calibrated ?i ?r))
		)
)

(:action communicate_all_data
 :parameters (?r - rover ?l - lander ?psoil - waypoint ?prock - waypoint ?o - objective ?m - mode)
 :precondition (and (ready_soil_data ?r ?psoil) (ready_rock_data ?r ?prock) (ready_image_data ?r ?o ?m)
                   (available ?r)(channel_free ?l)
            )
 :effect (and (not (available ?r)) (not (channel_free ?l))(channel_free ?l)
		(communicated ?psoil ?prock ?o ?m) (available ?r)
	)
)

(:action prepare_to_communicate_soil_data
 :parameters (?r - rover ?p - waypoint)
 :precondition (and (have_soil_analysis ?r ?p) 
            )
 :effect (and (ready_soil_data ?r ?p)
	)
)

(:action prepare_to_communicate_rock_data
 :parameters (?r - rover ?p - waypoint)
 :precondition (and (have_rock_analysis ?r ?p)
			)
 :effect (and (ready_rock_data ?r ?p)
          )
)


(:action prepare_to_communicate_image_data
 :parameters (?r - rover ?o - objective ?m - mode)
 :precondition (and (have_image ?r ?o ?m)
            )
 :effect (and (ready_image_data ?r ?o ?m)
          )
)

)