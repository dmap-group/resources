(define (domain wireless)
	(:requirements :strips :factored-privacy :typing)
(:types
	 node level message - object 
 	 base sensor - node 
 )
(:constants
	base  - base
	node1 node2 node3 node4 node5  - sensor
	Zero Low Normal High  - level
)
(:predicates
	(not-message-at ?m - message ?n - node)
	(not-message-data ?m - message ?s - sensor)
	(not-sending ?from - sensor ?to - node ?m - message)
	(neighbor ?n1 - node ?n2 - node)
	(has-data ?n - node ?s - sensor)
	(higher ?l1 - level ?l2 - level)
	(next ?l1 - level ?l2 - level)
	(is-message-at ?m - message ?n - node)
	(message-data ?m - message ?s - sensor)
	(sending ?from - sensor ?to - node ?m - message)
)

(:action receive-message_base
	:parameters (?sender - sensor ?m - message)
	:precondition (and
		(not-message-at ?m base)
		(sending ?sender base ?m)
	)
	:effect (and
		(not-sending ?sender base ?m)
		(not (sending ?sender base ?m))
		(not (not-message-at ?m base))
		(is-message-at ?m base)
	)
)


(:action get-data-from-message_base
	:parameters (?s - sensor ?m - message)
	:precondition (and
		(is-message-at ?m base)
		(message-data ?m ?s)
	)
	:effect (and
		(not-message-data ?m ?s)
		(not (message-data ?m ?s))
		(has-data base ?s)
	)
)

)