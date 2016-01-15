(define (domain wireless)
	(:requirements :strips :factored-privacy :typing)
(:types
	 node level message - object 
 	 base sensor - node 
 )
(:constants
	base  - base
	node1 node2 node3 node4 node5 node7 node8 node9 node10  - sensor
	Zero Low Normal High  - level
)
(:predicates
	(neighbor ?n1 - node ?n2 - node)
	(has-data ?n - node ?s - sensor)
	(higher ?l1 - level ?l2 - level)
	(next ?l1 - level ?l2 - level)
	(is-message-at ?m - message ?n - node)
	(message-data ?m - message ?s - sensor)
	(sending ?from - sensor ?to - node ?m - message)

	(:private
		(energy ?s - sensor ?lv - level)
	)
)

(:action generate-data_node2
	:parameters (?e0 - level ?e1 - level)
	:precondition (and
		(energy node2 ?e0)
		(higher ?e0 Zero)
		(next ?e0 ?e1)
	)
	:effect (and
		(not (energy node2 ?e0))
		(energy node2 ?e1)
		(has-data node2 node2)
	)
)


(:action add-to-message_node2
	:parameters (?s2 - sensor ?m - message)
	:precondition (and
		(has-data node2 ?s2)
		(is-message-at ?m node2)
		(not (message-data ?m ?s2))
	)
	:effect (and
		(not (has-data node2 ?s2))
		(message-data ?m ?s2)
	)
)


(:action send-message_node2
	:parameters (?receiver - node ?m - message ?e0 - level ?e1 - level)
	:precondition (and
		(energy node2 ?e0)
		(higher ?e0 Zero)
		(next ?e0 ?e1)
		(neighbor node2 ?receiver)
		(is-message-at ?m node2)
		(not (is-message-at ?m ?receiver))
		(not (sending node2 ?receiver ?m))
	)
	:effect (and
		(not (energy node2 ?e0))
		(not (is-message-at ?m node2))
		(energy node2 ?e1)
		(sending node2 ?receiver ?m)
	)
)


(:action receive-message_node2
	:parameters (?sender - sensor ?m - message)
	:precondition (and
		(not (is-message-at ?m node2))
		(sending ?sender node2 ?m)
	)
	:effect (and
		(not (sending ?sender node2 ?m))
		(is-message-at ?m node2)
	)
)


(:action get-data-from-message_node2
	:parameters (?s - sensor ?m - message)
	:precondition (and
		(is-message-at ?m node2)
		(message-data ?m ?s)
	)
	:effect (and
		(not (message-data ?m ?s))
		(has-data node2 ?s)
	)
)

)