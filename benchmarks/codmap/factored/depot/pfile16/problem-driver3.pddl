(define (problem depotprob4398) (:domain depot)
(:objects
	distributor1 - distributor
	distributor0 - distributor
	depot0 - depot
	depot1 - depot
	pallet5 - pallet
	pallet4 - pallet
	pallet7 - pallet
	pallet6 - pallet
	pallet1 - pallet
	pallet0 - pallet
	pallet3 - pallet
	pallet2 - pallet
	truck1 - truck
	truck0 - truck
	truck3 - truck
	truck2 - truck
	crate5 - crate
	crate4 - crate
	crate1 - crate
	crate0 - crate
	crate3 - crate
	crate2 - crate

	(:private
		driver3 - driver
	)
)
(:init
	(driving driver3 truck3)
	(at pallet0 depot0)
	(clear crate5)
	(at pallet1 depot1)
	(clear crate3)
	(at pallet2 distributor0)
	(clear crate4)
	(at pallet3 distributor1)
	(clear pallet3)
	(at pallet4 depot1)
	(clear crate0)
	(at pallet5 distributor1)
	(clear pallet5)
	(at pallet6 depot1)
	(clear pallet6)
	(at pallet7 distributor0)
	(clear pallet7)
	(at truck0 depot1)
	(at truck1 depot1)
	(at truck2 depot0)
	(at truck3 distributor1)
	(at crate0 depot1)
	(on crate0 pallet4)
	(at crate1 depot1)
	(on crate1 pallet1)
	(at crate2 depot0)
	(on crate2 pallet0)
	(at crate3 depot1)
	(on crate3 crate1)
	(at crate4 distributor0)
	(on crate4 pallet2)
	(at crate5 depot0)
	(on crate5 crate2)
)
(:goal
	(and
		(on crate0 pallet3)
		(on crate2 pallet1)
		(on crate3 pallet0)
		(on crate4 crate3)
		(on crate5 pallet2)
	)
)
)