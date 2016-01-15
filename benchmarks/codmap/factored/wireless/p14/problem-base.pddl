(define (problem wireless-14) (:domain wireless)
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
	msg1-2 - message
	msg2-2 - message
	msg3-2 - message
	msg4-2 - message
	msg5-2 - message
	msg6-2 - message
	msg7-2 - message
	msg8-2 - message
	msg9-2 - message
	msg10-2 - message
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
	(is-message-at msg1-2 node1)
	(is-message-at msg2-1 node2)
	(is-message-at msg2-2 node2)
	(is-message-at msg3-1 node3)
	(is-message-at msg3-2 node3)
	(is-message-at msg5-1 node5)
	(is-message-at msg5-2 node5)
	(is-message-at msg6-1 node6)
	(is-message-at msg6-2 node6)
	(is-message-at msg7-1 node7)
	(is-message-at msg7-2 node7)
	(is-message-at msg8-1 node8)
	(is-message-at msg8-2 node8)
	(is-message-at msg9-1 node9)
	(is-message-at msg9-2 node9)
	(is-message-at msg10-1 node10)
	(is-message-at msg10-2 node10)
	(neighbor node1 node2)
	(neighbor node1 node9)
	(neighbor node2 node1)
	(neighbor node2 node3)
	(neighbor node2 node6)
	(neighbor node2 node9)
	(neighbor node3 node2)
	(neighbor node3 node5)
	(neighbor node5 node3)
	(neighbor node5 base)
	(neighbor node5 node6)
	(neighbor base node5)
	(neighbor base node6)
	(neighbor base node7)
	(neighbor node6 node2)
	(neighbor node6 node5)
	(neighbor node6 base)
	(neighbor node6 node7)
	(neighbor node6 node8)
	(neighbor node6 node9)
	(neighbor node7 base)
	(neighbor node7 node6)
	(neighbor node7 node8)
	(neighbor node8 node6)
	(neighbor node8 node7)
	(neighbor node9 node1)
	(neighbor node9 node2)
	(neighbor node9 node6)
	(neighbor node9 node10)
	(neighbor node10 node9)
)
(:goal
	(and
		(has-data base node1)
		(has-data base node2)
		(has-data base node3)
		(has-data base node5)
		(has-data base node6)
		(has-data base node7)
		(has-data base node8)
		(has-data base node9)
		(has-data base node10)
	)
)
)