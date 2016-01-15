(define (problem wood-prob) (:domain woodworking)
(:objects
	green - acolour
	mauve - acolour
	blue - acolour
	red - acolour
	black - acolour
	white - acolour
	cherry - awood
	mahogany - awood
	p0 - part
	p1 - part
	p2 - part
	p3 - part
	p4 - part
	p5 - part
	p6 - part
	p7 - part
	p8 - part
	b0 - board
	b1 - board
	b2 - board
	s0 - aboardsize
	s1 - aboardsize
	s2 - aboardsize
	s3 - aboardsize
	s4 - aboardsize
	s5 - aboardsize
	s6 - aboardsize
	s7 - aboardsize
	s8 - aboardsize
	s9 - aboardsize

	(:private
		immersion-varnisher0 - immersion-varnisher
	)
)
(:init
	(is-smooth smooth)
	(is-smooth verysmooth)
	(boardsize-successor s0 s1)
	(boardsize-successor s1 s2)
	(boardsize-successor s2 s3)
	(boardsize-successor s3 s4)
	(boardsize-successor s4 s5)
	(boardsize-successor s5 s6)
	(boardsize-successor s6 s7)
	(boardsize-successor s7 s8)
	(boardsize-successor s8 s9)
	(has-colour immersion-varnisher0 blue)
	(has-colour immersion-varnisher0 white)
	(has-colour immersion-varnisher0 black)
	(has-colour immersion-varnisher0 red)
	(unused p0)
	(goalsize p0 large)
	(unused p1)
	(goalsize p1 medium)
	(unused p2)
	(goalsize p2 small)
	(unused p3)
	(goalsize p3 medium)
	(unused p4)
	(goalsize p4 small)
	(unused p5)
	(goalsize p5 small)
	(unused p6)
	(goalsize p6 medium)
	(unused p7)
	(goalsize p7 large)
	(unused p8)
	(goalsize p8 large)
	(boardsize b0 s9)
	(wood b0 cherry)
	(surface-condition b0 rough)
	(available b0)
	(boardsize b1 s7)
	(wood b1 mahogany)
	(surface-condition b1 rough)
	(available b1)
	(boardsize b2 s7)
	(wood b2 mahogany)
	(surface-condition b2 rough)
	(available b2)
	(= (total-cost) 0) 
	(= (spray-varnish-cost p0) 15) 
	(= (glaze-cost p0) 20) 
	(= (grind-cost p0) 45) 
	(= (plane-cost p0) 30) 
	(= (spray-varnish-cost p1) 10) 
	(= (glaze-cost p1) 15) 
	(= (grind-cost p1) 30) 
	(= (plane-cost p1) 20) 
	(= (spray-varnish-cost p2) 5) 
	(= (glaze-cost p2) 10) 
	(= (grind-cost p2) 15) 
	(= (plane-cost p2) 10) 
	(= (spray-varnish-cost p3) 10) 
	(= (glaze-cost p3) 15) 
	(= (grind-cost p3) 30) 
	(= (plane-cost p3) 20) 
	(= (spray-varnish-cost p4) 5) 
	(= (glaze-cost p4) 10) 
	(= (grind-cost p4) 15) 
	(= (plane-cost p4) 10) 
	(= (spray-varnish-cost p5) 5) 
	(= (glaze-cost p5) 10) 
	(= (grind-cost p5) 15) 
	(= (plane-cost p5) 10) 
	(= (spray-varnish-cost p6) 10) 
	(= (glaze-cost p6) 15) 
	(= (grind-cost p6) 30) 
	(= (plane-cost p6) 20) 
	(= (spray-varnish-cost p7) 15) 
	(= (glaze-cost p7) 20) 
	(= (grind-cost p7) 45) 
	(= (plane-cost p7) 30) 
	(= (spray-varnish-cost p8) 15) 
	(= (glaze-cost p8) 20) 
	(= (grind-cost p8) 45) 
	(= (plane-cost p8) 30) 
)
(:goal
	(and
		(available p0)
		(colour p0 red)
		(wood p0 cherry)
		(surface-condition p0 verysmooth)
		(treatment p0 varnished)
		(available p1)
		(colour p1 blue)
		(surface-condition p1 verysmooth)
		(available p2)
		(colour p2 white)
		(wood p2 cherry)
		(surface-condition p2 smooth)
		(treatment p2 varnished)
		(available p3)
		(surface-condition p3 smooth)
		(treatment p3 glazed)
		(available p4)
		(colour p4 black)
		(wood p4 mahogany)
		(surface-condition p4 smooth)
		(treatment p4 varnished)
		(available p5)
		(colour p5 white)
		(wood p5 mahogany)
		(available p6)
		(colour p6 white)
		(treatment p6 glazed)
		(available p7)
		(wood p7 cherry)
		(surface-condition p7 smooth)
		(available p8)
		(wood p8 mahogany)
		(treatment p8 glazed)
	)
)
(:metric minimize (total-cost))
)