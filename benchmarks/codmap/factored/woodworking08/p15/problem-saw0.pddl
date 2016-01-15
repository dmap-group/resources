(define (problem wood-prob) (:domain woodworking)
(:objects
	mauve - acolour
	white - acolour
	blue - acolour
	black - acolour
	red - acolour
	green - acolour
	oak - awood
	mahogany - awood
	teak - awood
	beech - awood
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
	p12 - part
	p13 - part
	p14 - part
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
	s9 - aboardsize
	s10 - aboardsize
	s11 - aboardsize

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
	(boardsize-successor s8 s9)
	(boardsize-successor s9 s10)
	(boardsize-successor s10 s11)
	(unused p0)
	(goalsize p0 large)
	(unused p1)
	(goalsize p1 large)
	(unused p2)
	(goalsize p2 small)
	(available p3)
	(colour p3 green)
	(wood p3 beech)
	(surface-condition p3 verysmooth)
	(treatment p3 varnished)
	(goalsize p3 large)
	(unused p4)
	(goalsize p4 medium)
	(unused p5)
	(goalsize p5 large)
	(unused p6)
	(goalsize p6 large)
	(unused p7)
	(goalsize p7 large)
	(unused p8)
	(goalsize p8 large)
	(unused p9)
	(goalsize p9 medium)
	(unused p10)
	(goalsize p10 large)
	(unused p11)
	(goalsize p11 small)
	(unused p12)
	(goalsize p12 large)
	(available p13)
	(colour p13 red)
	(wood p13 beech)
	(surface-condition p13 rough)
	(treatment p13 glazed)
	(goalsize p13 medium)
	(available p14)
	(colour p14 green)
	(wood p14 teak)
	(surface-condition p14 rough)
	(treatment p14 colourfragments)
	(goalsize p14 small)
	(boardsize b0 s10)
	(wood b0 beech)
	(surface-condition b0 rough)
	(available b0)
	(boardsize b1 s5)
	(wood b1 teak)
	(surface-condition b1 rough)
	(available b1)
	(boardsize b2 s9)
	(wood b2 mahogany)
	(surface-condition b2 rough)
	(available b2)
	(boardsize b3 s11)
	(wood b3 oak)
	(surface-condition b3 rough)
	(available b3)
	(boardsize b4 s3)
	(wood b4 oak)
	(surface-condition b4 rough)
	(available b4)
	(= (total-cost) 0) 
	(= (spray-varnish-cost p0) 15) 
	(= (glaze-cost p0) 20) 
	(= (grind-cost p0) 45) 
	(= (plane-cost p0) 30) 
	(= (spray-varnish-cost p1) 15) 
	(= (glaze-cost p1) 20) 
	(= (grind-cost p1) 45) 
	(= (plane-cost p1) 30) 
	(= (spray-varnish-cost p2) 5) 
	(= (glaze-cost p2) 10) 
	(= (grind-cost p2) 15) 
	(= (plane-cost p2) 10) 
	(= (spray-varnish-cost p3) 15) 
	(= (glaze-cost p3) 20) 
	(= (grind-cost p3) 45) 
	(= (plane-cost p3) 30) 
	(= (spray-varnish-cost p4) 10) 
	(= (glaze-cost p4) 15) 
	(= (grind-cost p4) 30) 
	(= (plane-cost p4) 20) 
	(= (spray-varnish-cost p5) 15) 
	(= (glaze-cost p5) 20) 
	(= (grind-cost p5) 45) 
	(= (plane-cost p5) 30) 
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
	(= (spray-varnish-cost p9) 10) 
	(= (glaze-cost p9) 15) 
	(= (grind-cost p9) 30) 
	(= (plane-cost p9) 20) 
	(= (spray-varnish-cost p10) 15) 
	(= (glaze-cost p10) 20) 
	(= (grind-cost p10) 45) 
	(= (plane-cost p10) 30) 
	(= (spray-varnish-cost p11) 5) 
	(= (glaze-cost p11) 10) 
	(= (grind-cost p11) 15) 
	(= (plane-cost p11) 10) 
	(= (spray-varnish-cost p12) 15) 
	(= (glaze-cost p12) 20) 
	(= (grind-cost p12) 45) 
	(= (plane-cost p12) 30) 
	(= (spray-varnish-cost p13) 10) 
	(= (glaze-cost p13) 15) 
	(= (grind-cost p13) 30) 
	(= (plane-cost p13) 20) 
	(= (spray-varnish-cost p14) 5) 
	(= (glaze-cost p14) 10) 
	(= (grind-cost p14) 15) 
	(= (plane-cost p14) 10) 
)
(:goal
	(and
		(available p0)
		(colour p0 white)
		(treatment p0 glazed)
		(available p1)
		(wood p1 mahogany)
		(surface-condition p1 verysmooth)
		(available p2)
		(surface-condition p2 smooth)
		(treatment p2 varnished)
		(available p3)
		(colour p3 red)
		(treatment p3 glazed)
		(available p4)
		(colour p4 blue)
		(surface-condition p4 verysmooth)
		(treatment p4 varnished)
		(available p5)
		(surface-condition p5 smooth)
		(treatment p5 varnished)
		(available p6)
		(surface-condition p6 smooth)
		(treatment p6 glazed)
		(available p7)
		(wood p7 mahogany)
		(treatment p7 varnished)
		(available p8)
		(colour p8 red)
		(wood p8 beech)
		(surface-condition p8 smooth)
		(treatment p8 glazed)
		(available p9)
		(wood p9 oak)
		(surface-condition p9 smooth)
		(available p10)
		(wood p10 oak)
		(surface-condition p10 verysmooth)
		(available p11)
		(colour p11 white)
		(wood p11 mahogany)
		(surface-condition p11 smooth)
		(treatment p11 varnished)
		(available p12)
		(wood p12 oak)
		(surface-condition p12 smooth)
		(available p13)
		(colour p13 blue)
		(wood p13 beech)
		(treatment p13 glazed)
		(available p14)
		(surface-condition p14 smooth)
		(treatment p14 glazed)
	)
)
(:metric minimize (total-cost))
)