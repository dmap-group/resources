(define (domain truck-crane-factory)
  (:requirements :strips :typing)
  (:types
      location - object)

  (:predicates
    (truck-started)
    (factory-started)
    (truck-at ?location - location)
    (factory-at ?location - location)
    (box-at ?location - location)
    (box-at-truck)
    (box-in-factory))

  (:action load-crane
    :parameters
        (?loc - location)
    :precondition
        (and (truck-at ?loc)
             (box-at ?loc))
    :effect
        (and (not (box-at ?loc))
             (box-at-truck)))

  (:action unload-crane
    :parameters
        (?loc - location)
    :precondition
        (and (truck-at ?loc)
             (box-at-truck))
    :effect
        (and (not (box-at-truck))
             (box-at ?loc)))


  (:action feed-crane
    :parameters
        (?loc - location)
    :precondition
        (and (factory-at ?loc)
             (box-at ?loc))
    :effect
        (and (not (box-at ?loc))
             (box-in-factory)))

  (:action start-factory
    :parameters
        ()
    :precondition
        (and (box-in-factory))
    :effect
        (factory-started))

  (:action start-truck
    :parameters
        ()
    :precondition
        (and)
    :effect
        (truck-started))

  (:action move-truck
    :parameters
        (?loc-from - location
         ?loc-to - location)
    :precondition
        (and (truck-started) (truck-at ?loc-from))
    :effect
        (and (not (truck-at ?loc-from))
             (truck-at ?loc-to))))



