(define (problem BLOCKS-4-0) (:domain blocks)
(:objects
	a - block
	c - block
	b - block
	e - block
	d - block
	g - block
	f - block
	i - block
	h - block

	(:private
		a2 - agent
	)
)
(:init
	(handempty a2)
	(clear f)
	(ontable a)
	(on f e)
	(on e b)
	(on b d)
	(on d c)
	(on c i)
	(on i g)
	(on g h)
	(on h a)
)
(:goal
	(and
		(on d i)
		(on i a)
		(on a b)
		(on b h)
		(on h g)
		(on g f)
		(on f e)
		(on e c)
	)
)
)