(define (domain deconfliction)
  (:requirements :strips :typing)
  (:types
      robot place - object)

  (:predicates (conn ?x - place ?y - place)
               (at ?r - robot ?x - place)
               (empty ?x - place))

  (:action move
    :parameters (?r - robot ?curpos - place ?nextpos - place)
    :precondition (and (at ?r ?curpos) (conn ?curpos ?nextpos) (empty ?nextpos))
    :effect (and (at ?r ?nextpos) (not (at ?r ?curpos)) (empty ?curpos) (not (empty ?nextpos)))))
