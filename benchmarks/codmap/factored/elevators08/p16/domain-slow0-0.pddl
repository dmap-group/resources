(define (domain elevators-sequencedstrips)
	(:requirements :factored-privacy :typing)
(:types
	 elevator passenger count - object 
 	 slow-elevator fast-elevator - elevator 
 )
(:predicates
	(next ?n1 - count ?n2 - count)
	(passenger-at ?person - passenger ?floor - count)
	(above ?floor1 - count ?floor2 - count)
	(can-hold ?agent - elevator ?n - count)
	(reachable-floor ?agent - elevator ?floor - count)
	(lift-at ?lift - elevator ?floor - count)
	(boarded ?person - passenger ?lift - elevator)
	(passengers ?lift - elevator ?n - count)
)
(:functions
	(total-cost) - number
	(travel-slow ?f1 - count ?f2 - count) - number
	(travel-fast ?f1 - count ?f2 - count) - number
)

(:action move-up-slow
	:parameters (?lift - slow-elevator ?f1 - count ?f2 - count)
	:precondition (and
		(lift-at ?lift ?f1)
		(above ?f1 ?f2)
		(reachable-floor ?lift ?f2)
	)
	:effect (and
		(lift-at ?lift ?f2)
		(not (lift-at ?lift ?f1))
		(increase ( total-cost ) ( travel-slow ?f1 ?f2 ))
	)
)


(:action move-down-slow
	:parameters (?lift - slow-elevator ?f1 - count ?f2 - count)
	:precondition (and
		(lift-at ?lift ?f1)
		(above ?f2 ?f1)
		(reachable-floor ?lift ?f2)
	)
	:effect (and
		(lift-at ?lift ?f2)
		(not (lift-at ?lift ?f1))
		(increase ( total-cost ) ( travel-slow ?f2 ?f1 ))
	)
)


(:action board
	:parameters (?lift - elevator ?p - passenger ?f - count ?n1 - count ?n2 - count)
	:precondition (and
		(lift-at ?lift ?f)
		(passenger-at ?p ?f)
		(passengers ?lift ?n1)
		(next ?n1 ?n2)
		(can-hold ?lift ?n2)
	)
	:effect (and
		(not (passenger-at ?p ?f))
		(boarded ?p ?lift)
		(not (passengers ?lift ?n1))
		(passengers ?lift ?n2)
	)
)


(:action leave
	:parameters (?lift - elevator ?p - passenger ?f - count ?n1 - count ?n2 - count)
	:precondition (and
		(lift-at ?lift ?f)
		(boarded ?p ?lift)
		(passengers ?lift ?n1)
		(next ?n2 ?n1)
	)
	:effect (and
		(passenger-at ?p ?f)
		(not (boarded ?p ?lift))
		(not (passengers ?lift ?n1))
		(passengers ?lift ?n2)
	)
)

)