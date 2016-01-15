(define (problem logistics-6-0) (:domain logistics)
(:objects
	obj21 - package
	obj22 - package
	obj23 - package
	apt2 - airport
	apt1 - airport
	obj11 - package
	obj13 - package
	obj12 - package
	pos2 - location

	(:private
		cit2 - city
		tru2 - truck
	)
)
(:init
	(at tru2 pos2)
	(at obj21 pos2)
	(at obj22 pos2)
	(at obj23 pos2)
	(in-city tru2 pos2 cit2)
	(in-city tru2 apt2 cit2)
)
(:goal
	(and
		(at obj12 apt2)
		(at obj23 apt1)
		(at obj21 apt2)
		(at obj22 pos2)
		(at obj13 pos2)
		(at obj11 apt2)
	)
)
)