(define (problem logistics-9-0) (:domain logistics)
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
	pos3 - location
	pos1 - location

	(:private
		tru3 - truck
		cit3 - city
	)
)
(:init
	(at obj11 pos1)
	(at obj12 pos1)
	(at obj13 pos1)
	(at tru3 pos3)
	(at obj31 pos3)
	(at obj32 pos3)
	(at obj33 pos3)
	(in-city tru3 pos3 cit3)
	(in-city tru3 apt3 cit3)
)
(:goal
	(and
		(at obj23 pos3)
		(at obj32 pos1)
		(at obj22 pos1)
		(at obj31 apt3)
		(at obj11 pos1)
		(at obj33 pos3)
		(at obj13 apt3)
		(at obj12 pos1)
		(at obj21 apt1)
	)
)
)