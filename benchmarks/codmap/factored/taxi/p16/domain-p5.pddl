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

(:action enter_p5
	:parameters (?t - taxi ?l - location)
	:precondition (and
		(at p5 ?l)
		(at ?t ?l)
		(empty ?t)
	)
	:effect (and
		(not (empty ?t))
		(not (at p5 ?l))
		(in p5 ?t)
	)
)


(:action exit_p5
	:parameters (?t - taxi ?l - location)
	:precondition (and
		(in p5 ?t)
		(at ?t ?l)
		(goal-of p5 ?l)
	)
	:effect (and
		(not (in p5 ?t))
		(empty ?t)
		(at p5 ?l)
	)
)

)