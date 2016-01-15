(define (problem wireless-09) (:domain wireless)
(:objects
	msg1-1 - message
	msg2-1 - message
	msg3-1 - message
	msg4-1 - message
	msg5-1 - message
	msg6-1 - message
	msg7-1 - message
	msg8-1 - message
	msg9-1 - message
	msg10-1 - message
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
	(is-message-at msg1-1 node1)
	(is-message-at msg2-1 node2)
	(is-message-at msg3-1 node3)
	(is-message-at msg4-1 node4)
	(is-message-at msg5-1 node5)
	(is-message-at msg7-1 node7)
	(is-message-at msg8-1 node8)
	(is-message-at msg9-1 node9)
	(is-message-at msg10-1 node10)
	(neighbor node1 node2)
	(neighbor node1 node9)
	(neighbor node2 node1)
	(neighbor node2 node3)
	(neighbor node2 node9)
	(neighbor node3 node2)
	(neighbor node3 node4)
	(neighbor node4 node3)
	(neighbor node3 node5)
	(neighbor node5 node3)
	(neighbor node4 node5)
	(neighbor node5 node4)
	(neighbor node5 base)
	(neighbor base node5)
	(neighbor base node7)
	(neighbor node7 base)
	(neighbor node7 node8)
	(neighbor node8 node7)
	(neighbor node9 node1)
	(neighbor node9 node2)
	(neighbor node9 node10)
	(neighbor node10 node9)
)
(:goal
	(and
		(has-data base node1)
		(has-data base node2)
		(has-data base node3)
		(has-data base node4)
		(has-data base node5)
		(has-data base node7)
		(has-data base node8)
		(has-data base node9)
		(has-data base node10)
	)
)
)