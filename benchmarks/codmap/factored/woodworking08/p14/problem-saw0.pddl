(define (problem wood-prob) (:domain woodworking)
(:objects
	green - acolour
	blue - acolour
	red - acolour
	mauve - acolour
	white - acolour
	black - acolour
	beech - awood
	teak - awood
	cherry - awood
	p0 - part
	p1 - part
	p2 - part
	p3 - part
	p4 - part
	p5 - part
	p6 - part
	p7 - part
	p8 - part
	p9 - part
	p10 - part
	p11 - part
	b0 - board
	b1 - board
	b2 - board
	b3 - board
	b4 - board
	s0 - aboardsize
	s1 - aboardsize
	s2 - aboardsize
	s3 - aboardsize
	s4 - aboardsize
	s5 - aboardsize
	s6 - aboardsize
	s7 - aboardsize
	s8 - aboardsize

	(:private
		saw0 - saw
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
	(unused p0)
	(goalsize p0 small)
	(available p1)
	(colour p1 blue)
	(wood p1 beech)
	(surface-condition p1 smooth)
	(treatment p1 glazed)
	(goalsize p1 small)
	(unused p2)
	(goalsize p2 large)
	(unused p3)
	(goalsize p3 small)
	(unused p4)
	(goalsize p4 medium)
	(unused p5)
	(goalsize p5 medium)
	(unused p6)
	(goalsize p6 large)
	(unused p7)
	(goalsize p7 large)
	(unused p8)
	(goalsize p8 large)
	(unused p9)
	(goalsize p9 small)
	(unused p10)
	(goalsize p10 medium)
	(unused p11)
	(goalsize p11 medium)
	(boardsize b0 s6)
	(wood b0 beech)
	(surface-condition b0 smooth)
	(available b0)
	(boardsize b1 s6)
	(wood b1 beech)
	(surface-condition b1 rough)
	(available b1)
	(boardsize b2 s8)
	(wood b2 cherry)
	(surface-condition b2 rough)
	(available b2)
	(boardsize b3 s3)
	(wood b3 cherry)
	(surface-condition b3 smooth)
	(available b3)
	(boardsize b4 s5)
	(wood b4 teak)
	(surface-condition b4 rough)
	(available b4)
	(= (total-cost) 0) 
	(= (spray-varnish-cost p0) 5) 
	(= (glaze-cost p0) 10) 
	(= (grind-cost p0) 15) 
	(= (plane-cost p0) 10) 
	(= (spray-varnish-cost p1) 5) 
	(= (glaze-cost p1) 10) 
	(= (grind-cost p1) 15) 
	(= (plane-cost p1) 10) 
	(= (spray-varnish-cost p2) 15) 
	(= (glaze-cost p2) 20) 
	(= (grind-cost p2) 45) 
	(= (plane-cost p2) 30) 
	(= (spray-varnish-cost p3) 5) 
	(= (glaze-cost p3) 10) 
	(= (grind-cost p3) 15) 
	(= (plane-cost p3) 10) 
	(= (spray-varnish-cost p4) 10) 
	(= (glaze-cost p4) 15) 
	(= (grind-cost p4) 30) 
	(= (plane-cost p4) 20) 
	(= (spray-varnish-cost p5) 10) 
	(= (glaze-cost p5) 15) 
	(= (grind-cost p5) 30) 
	(= (plane-cost p5) 20) 
	(= (spray-varnish-cost p6) 15) 
	(= (glaze-cost p6) 20) 
	(= (grind-cost p6) 45) 
	(= (plane-cost p6) 30) 
	(= (spray-varnish-cost p7) 15) 
	(= (glaze-cost p7) 20) 
	(= (grind-cost p7) 45) 
	(= (plane-cost p7) 30) 
	(= (spray-varnish-cost p8) 15) 
	(= (glaze-cost p8) 20) 
	(= (grind-cost p8) 45) 
	(= (plane-cost p8) 30) 
	(= (spray-varnish-cost p9) 5) 
	(= (glaze-cost p9) 10) 
	(= (grind-cost p9) 15) 
	(= (plane-cost p9) 10) 
	(= (spray-varnish-cost p10) 10) 
	(= (glaze-cost p10) 15) 
	(= (grind-cost p10) 30) 
	(= (plane-cost p10) 20) 
	(= (spray-varnish-cost p11) 10) 
	(= (glaze-cost p11) 15) 
	(= (grind-cost p11) 30) 
	(= (plane-cost p11) 20) 
)
(:goal
	(and
		(available p0)
		(wood p0 cherry)
		(surface-condition p0 verysmooth)
		(available p1)
		(colour p1 white)
		(surface-condition p1 verysmooth)
		(available p2)
		(wood p2 beech)
		(surface-condition p2 smooth)
		(available p3)
		(colour p3 blue)
		(wood p3 beech)
		(surface-condition p3 smooth)
		(treatment p3 varnished)
		(available p4)
		(colour p4 black)
		(wood p4 teak)
		(treatment p4 varnished)
		(available p5)
		(colour p5 blue)
		(wood p5 beech)
		(available p6)
		(colour p6 natural)
		(surface-condition p6 verysmooth)
		(available p7)
		(colour p7 white)
		(wood p7 beech)
		(surface-condition p7 verysmooth)
		(treatment p7 glazed)
		(available p8)
		(colour p8 red)
		(surface-condition p8 smooth)
		(available p9)
		(colour p9 red)
		(surface-condition p9 verysmooth)
		(available p10)
		(colour p10 green)
		(wood p10 cherry)
		(available p11)
		(surface-condition p11 verysmooth)
		(treatment p11 glazed)
	)
)
(:metric minimize (total-cost))
)