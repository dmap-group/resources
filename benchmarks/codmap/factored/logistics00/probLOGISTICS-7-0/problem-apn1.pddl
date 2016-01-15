(define (problem logistics-7-0) (:domain logistics)
(:objects
	obj21 - package
	obj22 - package
	obj23 - package
	obj33 - package
	obj32 - package
	obj31 - package
	apt3 - airport
	apt2 - airport
	apt1 - airport
	obj11 - package
	obj13 - package
	obj12 - package
	pos2 - location
	pos1 - location

	(:private
		apn1 - airplane
	)
)
(:init
	(at apn1 apt1)
	(at obj11 pos1)
	(at obj12 pos1)
	(at obj13 pos1)
	(at obj21 pos2)
	(at obj22 pos2)
	(at obj23 pos2)
)
(:goal
	(and
		(at obj22 pos2)
		(at obj33 apt1)
		(at obj12 pos2)
		(at obj13 apt3)
		(at obj31 apt2)
		(at obj23 apt1)
		(at obj32 pos1)
	)
)
)