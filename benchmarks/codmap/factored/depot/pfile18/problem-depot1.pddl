(define (problem depotprob1916) (:domain depot)
(:objects
	distributor1 - distributor
	distributor0 - distributor
	crate11 - crate
	crate10 - crate
	crate13 - crate
	crate12 - crate
	depot0 - depot
	crate14 - crate
	depot1 - depot
	pallet5 - pallet
	pallet4 - pallet
	pallet7 - pallet
	pallet6 - pallet
	pallet1 - pallet
	pallet0 - pallet
	pallet3 - pallet
	pallet2 - pallet
	crate9 - crate
	crate8 - crate
	truck1 - truck
	truck0 - truck
	truck3 - truck
	truck2 - truck
	crate5 - crate
	crate4 - crate
	crate7 - crate
	crate6 - crate
	crate1 - crate
	crate0 - crate
	crate3 - crate
	crate2 - crate

	(:private
		hoist1 - hoist
	)
)
(:init
	(at pallet0 depot0)
	(clear crate13)
	(at pallet1 depot1)
	(clear crate11)
	(at pallet2 distributor0)
	(clear crate14)
	(at pallet3 distributor1)
	(clear crate10)
	(at pallet4 depot0)
	(clear pallet4)
	(at pallet5 distributor0)
	(clear crate8)
	(at pallet6 distributor1)
	(clear crate3)
	(at pallet7 depot1)
	(clear crate5)
	(at truck0 depot1)
	(at truck1 distributor0)
	(at truck2 depot0)
	(at truck3 depot1)
	(at hoist1 depot1)
	(available depot1 hoist1)
	(at crate0 depot0)
	(on crate0 pallet0)
	(at crate1 depot1)
	(on crate1 pallet1)
	(at crate2 distributor0)
	(on crate2 pallet2)
	(at crate3 distributor1)
	(on crate3 pallet6)
	(at crate4 depot0)
	(on crate4 crate0)
	(at crate5 depot1)
	(on crate5 pallet7)
	(at crate6 distributor0)
	(on crate6 pallet5)
	(at crate7 depot0)
	(on crate7 crate4)
	(at crate8 distributor0)
	(on crate8 crate6)
	(at crate9 distributor1)
	(on crate9 pallet3)
	(at crate10 distributor1)
	(on crate10 crate9)
	(at crate11 depot1)
	(on crate11 crate1)
	(at crate12 distributor0)
	(on crate12 crate2)
	(at crate13 depot0)
	(on crate13 crate7)
	(at crate14 distributor0)
	(on crate14 crate12)
)
(:goal
	(and
		(on crate0 crate10)
		(on crate1 pallet6)
		(on crate2 crate12)
		(on crate4 pallet4)
		(on crate5 pallet2)
		(on crate6 pallet7)
		(on crate8 crate4)
		(on crate9 crate1)
		(on crate10 pallet1)
		(on crate11 pallet5)
		(on crate12 crate5)
		(on crate13 pallet3)
		(on crate14 pallet0)
	)
)
)