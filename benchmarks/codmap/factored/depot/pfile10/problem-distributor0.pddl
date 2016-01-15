(define (problem depotprob7654) (:domain depot)
(:objects
	distributor1 - distributor
	distributor0 - distributor
	distributor2 - distributor
	depot0 - depot
	depot1 - depot
	depot2 - depot
	pallet5 - pallet
	pallet4 - pallet
	pallet1 - pallet
	pallet0 - pallet
	pallet3 - pallet
	pallet2 - pallet
	truck1 - truck
	truck0 - truck
	crate5 - crate
	crate4 - crate
	crate1 - crate
	crate0 - crate
	crate3 - crate
	crate2 - crate

	(:private
		hoist3 - hoist
	)
)
(:init
	(at pallet0 depot0)
	(clear crate1)
	(at pallet1 depot1)
	(clear crate0)
	(at pallet2 depot2)
	(clear crate4)
	(at pallet3 distributor0)
	(clear crate5)
	(at pallet4 distributor1)
	(clear pallet4)
	(at pallet5 distributor2)
	(clear crate3)
	(at truck0 depot1)
	(at truck1 depot2)
	(at hoist3 distributor0)
	(available distributor0 hoist3)
	(at crate0 depot1)
	(on crate0 pallet1)
	(at crate1 depot0)
	(on crate1 pallet0)
	(at crate2 distributor2)
	(on crate2 pallet5)
	(at crate3 distributor2)
	(on crate3 crate2)
	(at crate4 depot2)
	(on crate4 pallet2)
	(at crate5 distributor0)
	(on crate5 pallet3)
)
(:goal
	(and
		(on crate0 crate4)
		(on crate2 pallet3)
		(on crate3 pallet0)
		(on crate4 pallet5)
	)
)
)