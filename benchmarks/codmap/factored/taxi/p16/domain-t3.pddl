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
)

(:action drive_t3
	:parameters (?from - location ?to - location)
	:precondition (and
		(at t3 ?from)
		(directly-connected ?from ?to)
		(free ?to)
	)
	:effect (and
		(not (at t3 ?from))
		(not (free ?to))
		(at t3 ?to)
		(free ?from)
	)
)

)