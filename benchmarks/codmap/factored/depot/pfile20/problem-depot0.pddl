(define (problem depotprob7615) (:domain depot)
(:objects
	crate11 - crate
	crate10 - crate
	crate13 - crate
	crate12 - crate
	depot0 - depot
	crate14 - crate
	depot2 - depot
	depot3 - depot
	pallet5 - pallet
	pallet4 - pallet
	pallet7 - pallet
	pallet6 - pallet
	pallet1 - pallet
	pallet0 - pallet
	pallet3 - pallet
	pallet2 - pallet
	pallet9 - pallet
	pallet8 - pallet
	truck1 - truck
	truck0 - truck
	truck3 - truck
	truck2 - truck
	distributor1 - distributor
	distributor0 - distributor
	distributor3 - distributor
	distributor2 - distributor
	depot1 - depot
	crate9 - crate
	crate8 - crate
	crate5 - crate
	crate4 - crate
	crate7 - crate
	crate6 - crate
	crate1 - crate
	crate0 - crate
	crate3 - crate
	crate2 - crate

	(:private
		hoist0 - hoist
	)
)
(:init
	(at pallet0 depot0)
	(clear crate13)
	(at pallet1 depot1)
	(clear crate14)
	(at pallet2 depot2)
	(clear pallet2)
	(at pallet3 depot3)
	(clear crate5)
	(at pallet4 distributor0)
	(clear pallet4)
	(at pallet5 distributor1)
	(clear crate9)
	(at pallet6 distributor2)
	(clear crate8)
	(at pallet7 distributor3)
	(clear crate10)
	(at pallet8 depot1)
	(clear crate11)
	(at pallet9 depot2)
	(clear pallet9)
	(at truck0 distributor2)
	(at truck1 depot0)
	(at truck2 depot1)
	(at truck3 distributor1)
	(at hoist0 depot0)
	(available depot0 hoist0)
	(at crate0 distributor3)
	(on crate0 pallet7)
	(at crate1 distributor1)
	(on crate1 pallet5)
	(at crate2 depot3)
	(on crate2 pallet3)
	(at crate3 depot0)
	(on crate3 pallet0)
	(at crate4 depot0)
	(on crate4 crate3)
	(at crate5 depot3)
	(on crate5 crate2)
	(at crate6 depot1)
	(on crate6 pallet1)
	(at crate7 distributor2)
	(on crate7 pallet6)
	(at crate8 distributor2)
	(on crate8 crate7)
	(at crate9 distributor1)
	(on crate9 crate1)
	(at crate10 distributor3)
	(on crate10 crate0)
	(at crate11 depot1)
	(on crate11 pallet8)
	(at crate12 depot1)
	(on crate12 crate6)
	(at crate13 depot0)
	(on crate13 crate4)
	(at crate14 depot1)
	(on crate14 crate12)
)
(:goal
	(and
		(on crate0 pallet3)
		(on crate1 crate11)
		(on crate2 pallet6)
		(on crate3 crate0)
		(on crate4 crate5)
		(on crate5 crate14)
		(on crate6 pallet4)
		(on crate7 pallet2)
		(on crate8 pallet7)
		(on crate9 crate8)
		(on crate11 pallet5)
		(on crate12 crate6)
		(on crate13 crate2)
		(on crate14 pallet1)
	)
)
)