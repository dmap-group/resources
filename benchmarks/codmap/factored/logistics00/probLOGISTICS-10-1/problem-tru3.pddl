(define (problem logistics-10-1) (:domain logistics)
(:objects
	apt3 - airport
	apt2 - airport
	apt1 - airport
	apt4 - airport
	pos4 - location
	pos3 - location
	pos1 - location
	obj21 - package
	obj22 - package
	obj23 - package
	obj33 - package
	obj32 - package
	obj31 - package
	obj42 - package
	obj43 - package
	obj41 - package
	obj11 - package
	obj13 - package
	obj12 - package

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
	(at obj41 pos4)
	(at obj42 pos4)
	(at obj43 pos4)
	(in-city tru3 pos3 cit3)
	(in-city tru3 apt3 cit3)
)
(:goal
	(and
		(at obj43 apt4)
		(at obj32 pos3)
		(at obj42 apt3)
		(at obj12 pos1)
		(at obj41 apt3)
		(at obj23 pos3)
		(at obj13 apt4)
		(at obj22 pos4)
		(at obj31 apt3)
		(at obj33 apt1)
	)
)
)