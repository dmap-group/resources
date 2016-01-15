(define (problem logistics-12-0) (:domain logistics)
(:objects
	apt3 - airport
	apt2 - airport
	apt1 - airport
	apt4 - airport
	pos4 - location
	pos2 - location
	pos3 - location
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
		cit4 - city
		tru4 - truck
	)
)
(:init
	(at obj21 pos2)
	(at obj22 pos2)
	(at obj23 pos2)
	(at obj31 pos3)
	(at obj32 pos3)
	(at obj33 pos3)
	(at tru4 pos4)
	(at obj41 pos4)
	(at obj42 pos4)
	(at obj43 pos4)
	(in-city tru4 pos4 cit4)
	(in-city tru4 apt4 cit4)
)
(:goal
	(and
		(at obj13 apt1)
		(at obj42 pos4)
		(at obj31 pos3)
		(at obj33 pos2)
		(at obj43 pos4)
		(at obj32 apt4)
		(at obj21 apt2)
		(at obj11 apt4)
		(at obj22 pos2)
		(at obj41 apt1)
		(at obj12 apt4)
		(at obj23 pos4)
	)
)
)