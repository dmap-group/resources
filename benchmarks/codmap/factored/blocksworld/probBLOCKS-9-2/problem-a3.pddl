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
		a3 - agent
	)
)
(:init
	(handempty a3)
	(clear h)
	(clear f)
	(ontable g)
	(ontable f)
	(on h a)
	(on a d)
	(on d e)
	(on e c)
	(on c i)
	(on i b)
	(on b g)
)
(:goal
	(and
		(on f g)
		(on g h)
		(on h d)
		(on d i)
		(on i e)
		(on e b)
		(on b c)
		(on c a)
	)
)
)