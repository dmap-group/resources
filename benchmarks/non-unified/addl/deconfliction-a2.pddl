(define (problem deconfliction-x3-y3-r2)
    (:domain deconfliction)
    (:requirements :strips :typing)

    (:objects
         f0x0f - place
         f1x0f - place
         f2x0f - place
         f0x1f - place
         f1x1f - place
         f2x1f - place
         f0x2f - place
         f1x2f - place
         f2x2f - place
        robot1 - robot
        robot2 - robot)
    (:init
        (conn f0x0f f1x0f) (conn f1x0f f2x0f) (conn f1x0f f0x0f) (conn f2x0f f1x0f)
        (conn f0x1f f1x1f) (conn f1x1f f2x1f) (conn f1x1f f0x1f) (conn f2x1f f1x1f)
        (conn f0x2f f1x2f) (conn f1x2f f2x2f) (conn f1x2f f0x2f) (conn f2x2f f1x2f)

        (conn f0x0f f0x1f) (conn f0x1f f0x2f) (conn f0x1f f0x0f) (conn f0x2f f0x1f)
        (conn f1x0f f1x1f) (conn f1x1f f1x2f) (conn f1x1f f1x0f) (conn f1x2f f1x1f)
        (conn f2x0f f2x1f) (conn f2x1f f2x2f) (conn f2x1f f2x0f) (conn f2x2f f2x1f)

        (empty f0x0f)
        (empty f1x0f)
        (empty f2x0f)

        (empty f1x1f)

        (empty f0x2f)
        (empty f1x2f)
        (empty f2x2f)

        (at robot1 f0x1f)
        (at robot2 f2x1f))
    (:goal
        (and (at robot1 f2x1f) (at robot2 f0x1f))))
