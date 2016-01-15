(define (domain taxi)
	(:requirements :strips :factored-privacy :typing)
(:types
	 location agent - object 
 	 taxi passenger - agent 
 )
(:constants
	t1 t2 t3  - taxi
	p1 p2 p3 p4 p5 p6  - passenger
)
(:predicates
	(directly-connected ?l1 - location ?l2 - location)
	(at ?a - agent ?l - location)
	(in ?p - passenger ?t - taxi)
	(empty ?t - taxi)
	(free ?l - location)

	(:private
		(goal-of ?p - passenger ?l - location)
	)
)

(:action enter_p6
	:parameters (?t - taxi ?l - location)
	:precondition (and
		(at p6 ?l)
		(at ?t ?l)
		(empty ?t)
	)
	:effect (and
		(not (empty ?t))
		(not (at p6 ?l))
		(in p6 ?t)
	)
)


(:action exit_p6
	:parameters (?t - taxi ?l - location)
	:precondition (and
		(in p6 ?t)
		(at ?t ?l)
		(goal-of p6 ?l)
	)
	:effect (and
		(not (in p6 ?t))
		(empty ?t)
		(at p6 ?l)
	)
)

)