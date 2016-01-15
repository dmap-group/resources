(define (problem logistics-9-1) (:domain logistics)
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
	pos3 - location

	(:private
		apn1 - airplane
	)
)
(:init
	(at apn1 apt1)
	(at obj21 pos2)
	(at obj22 pos2)
	(at obj23 pos2)
	(at obj31 pos3)
	(at obj32 pos3)
	(at obj33 pos3)
)
(:goal
	(and
		(at obj11 apt2)
		(at obj31 pos3)
		(at obj13 pos3)
		(at obj23 apt3)
		(at obj33 apt3)
		(at obj22 pos2)
		(at obj32 apt3)
		(at obj21 pos2)
		(at obj12 pos3)
	)
)
)