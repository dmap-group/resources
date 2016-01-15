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
	j - block

	(:private
		a2 - agent
	)
)
(:init
	(handempty a2)
	(clear c)
	(clear f)
	(ontable b)
	(ontable h)
	(on c g)
	(on g e)
	(on e i)
	(on i j)
	(on j a)
	(on a b)
	(on f d)
	(on d h)
)
(:goal
	(and
		(on c b)
		(on b d)
		(on d f)
		(on f i)
		(on i a)
		(on a e)
		(on e h)
		(on h g)
		(on g j)
	)
)
)