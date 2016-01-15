(define (problem wireless-03) (:domain wireless)
(:objects
	msg1-1 - message
	msg2-1 - message
	msg3-1 - message
	msg4-1 - message
	msg5-1 - message
)
(:init
	(higher High Low)
	(higher High Normal)
	(higher High Zero)
	(higher Normal Low)
	(higher Normal Zero)
	(higher Low Zero)
	(next High Normal)
	(next Normal Low)
	(next Low Zero)
	(energy node1 Normal)
	(is-message-at msg1-1 node1)
	(energy node2 Normal)
	(energy node3 Normal)
	(energy node4 Normal)
	(energy node5 High)
	(neighbor node1 node2)
	(neighbor node2 node1)
	(neighbor node2 node3)
	(neighbor node3 node2)
	(neighbor node3 node4)
	(neighbor node4 node3)
	(neighbor node3 node5)
	(neighbor node5 node3)
	(neighbor node4 node5)
	(neighbor node5 node4)
	(neighbor node5 base)
	(neighbor base node5)
)
(:goal
	(and
		(has-data base node1)
		(has-data base node2)
		(has-data base node3)
		(has-data base node4)
		(has-data base node5)
	)
)
)