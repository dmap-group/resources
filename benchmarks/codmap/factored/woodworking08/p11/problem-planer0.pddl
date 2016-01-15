(define (problem wood-prob) (:domain woodworking)
(:objects
	blue - acolour
	mauve - acolour
	beech - awood
	mahogany - awood
	p0 - part
	p1 - part
	p2 - part
	s0 - aboardsize

	(:private
		planer0 - planer
	)
)
(:init
	(is-smooth smooth)
	(is-smooth verysmooth)
	(available p0)
	(colour p0 blue)
	(wood p0 mahogany)
	(surface-condition p0 verysmooth)
	(treatment p0 colourfragments)
	(goalsize p0 small)
	(available p1)
	(colour p1 natural)
	(wood p1 mahogany)
	(surface-condition p1 smooth)
	(treatment p1 colourfragments)
	(goalsize p1 small)
	(available p2)
	(colour p2 mauve)
	(wood p2 beech)
	(surface-condition p2 verysmooth)
	(treatment p2 colourfragments)
	(goalsize p2 small)
	(= (total-cost) 0) 
	(= (spray-varnish-cost p0) 5) 
	(= (glaze-cost p0) 10) 
	(= (grind-cost p0) 15) 
	(= (plane-cost p0) 10) 
	(= (spray-varnish-cost p1) 5) 
	(= (glaze-cost p1) 10) 
	(= (grind-cost p1) 15) 
	(= (plane-cost p1) 10) 
	(= (spray-varnish-cost p2) 5) 
	(= (glaze-cost p2) 10) 
	(= (grind-cost p2) 15) 
	(= (plane-cost p2) 10) 
)
(:goal
	(and
		(available p0)
		(wood p0 mahogany)
		(surface-condition p0 smooth)
		(available p1)
		(surface-condition p1 smooth)
		(treatment p1 glazed)
		(available p2)
		(colour p2 natural)
		(treatment p2 glazed)
	)
)
(:metric minimize (total-cost))
)