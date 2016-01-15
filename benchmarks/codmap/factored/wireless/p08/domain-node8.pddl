(define (domain wireless)
	(:requirements :strips :factored-privacy :typing)
(:types
	 node level message - object 
 	 base sensor - node 
 )
(:constants
	base  - base
	node1 node2 node3 node5 node6 node7 node8 node9 node10  - sensor
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

(:action generate-data_node8
	:parameters (?e0 - level ?e1 - level)
	:precondition (and
		(energy node8 ?e0)
		(higher ?e0 Zero)
		(next ?e0 ?e1)
	)
	:effect (and
		(not (energy node8 ?e0))
		(energy node8 ?e1)
		(has-data node8 node8)
	)
)


(:action add-to-message_node8
	:parameters (?s2 - sensor ?m - message)
	:precondition (and
		(has-data node8 ?s2)
		(is-message-at ?m node8)
		(not (message-data ?m ?s2))
	)
	:effect (and
		(not (has-data node8 ?s2))
		(message-data ?m ?s2)
	)
)


(:action send-message_node8
	:parameters (?receiver - node ?m - message ?e0 - level ?e1 - level)
	:precondition (and
		(energy node8 ?e0)
		(higher ?e0 Zero)
		(next ?e0 ?e1)
		(neighbor node8 ?receiver)
		(is-message-at ?m node8)
		(not (is-message-at ?m ?receiver))
		(not (sending node8 ?receiver ?m))
	)
	:effect (and
		(not (energy node8 ?e0))
		(not (is-message-at ?m node8))
		(energy node8 ?e1)
		(sending node8 ?receiver ?m)
	)
)


(:action receive-message_node8
	:parameters (?sender - sensor ?m - message)
	:precondition (and
		(not (is-message-at ?m node8))
		(sending ?sender node8 ?m)
	)
	:effect (and
		(not (sending ?sender node8 ?m))
		(is-message-at ?m node8)
	)
)


(:action get-data-from-message_node8
	:parameters (?s - sensor ?m - message)
	:precondition (and
		(is-message-at ?m node8)
		(message-data ?m ?s)
	)
	:effect (and
		(not (message-data ?m ?s))
		(has-data node8 ?s)
	)
)

)