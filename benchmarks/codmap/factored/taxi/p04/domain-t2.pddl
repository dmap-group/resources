(define (domain taxi)
	(:requirements :strips :factored-privacy :typing)
(:types
	 location agent - object 
 	 taxi passenger - agent 
 )
(:constants
	t1 t2 t3  - taxi
	p1 p2 p3  - passenger
)
(:predicates
	(directly-connected ?l1 - location ?l2 - location)
	(at ?a - agent ?l - location)
	(in ?p - passenger ?t - taxi)
	(empty ?t - taxi)
	(free ?l - location)
)

(:action drive_t2
	:parameters (?from - location ?to - location)
	:precondition (and
		(at t2 ?from)
		(directly-connected ?from ?to)
		(free ?to)
	)
	:effect (and
		(not (at t2 ?from))
		(not (free ?to))
		(at t2 ?to)
		(free ?from)
	)
)

)