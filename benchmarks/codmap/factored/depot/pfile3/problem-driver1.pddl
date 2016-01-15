(define (problem depotprob1935) (:domain depot)
(:objects
	truck1 - truck
	distributor0 - distributor
	crate5 - crate
	crate4 - crate
	depot0 - depot
	crate0 - crate
	crate3 - crate
	crate2 - crate
	crate1 - crate
	pallet1 - pallet
	pallet0 - pallet
	pallet2 - pallet
	distributor1 - distributor
	truck0 - truck

	(:private
		driver1 - driver
	)
)
(:init
	(driving driver1 truck1)
	(at pallet0 depot0)
	(clear crate1)
	(at pallet1 distributor0)
	(clear crate4)
	(at pallet2 distributor1)
	(clear crate5)
	(at truck0 depot0)
	(at truck1 distributor0)
	(at crate0 distributor0)
	(on crate0 pallet1)
	(at crate1 depot0)
	(on crate1 pallet0)
	(at crate2 distributor1)
	(on crate2 pallet2)
	(at crate3 distributor0)
	(on crate3 crate0)
	(at crate4 distributor0)
	(on crate4 crate3)
	(at crate5 distributor1)
	(on crate5 crate2)
)
(:goal
	(and
		(on crate0 crate1)
		(on crate1 pallet2)
		(on crate2 pallet0)
		(on crate3 crate2)
		(on crate4 pallet1)
		(on crate5 crate0)
	)
)
)