(ns planning-deconfliction.core)


(defn sym-name [size]
  (symbol (str "deconfliction-x" size "-y" size "-r2")))

(defn gen-domain [size]
  (list :domain 'deconfliction))

(defn gen-objects [size]
  (concat (list :objects)
          (for [x (range size)
		y (range size)]
            (symbol (format "f%d-%df" x y)))
	
          (list 'robot1
                'robot2)))

(defn gen-init [size]
  (concat (list :init)
          (for [x (range size)
		y (range size)]
            (list 'place (symbol (format "f%d-%df" x y))))

	  (for [x (range (dec size))
		y (range size)]
            (list 'conn (symbol (format "f%d-%df" x y)) (symbol (format "f%d-%df" (inc x) y))) )

	  (for [x (range (dec size))
		y (range size)]
            (list 'conn (symbol (format "f%d-%df" (inc x) y)) (symbol (format "f%d-%df" x y))) )

          (for [x (range size)
		y (range (dec size))]
            (list 'conn (symbol (format "f%d-%df" x y)) (symbol (format "f%d-%df" x (inc y)))) )

	  (for [x (range size)
		y (range (dec size))]
            (list 'conn (symbol (format "f%d-%df" x (inc y))) (symbol (format "f%d-%df" x y))) )

	  (list
	    (list 'robot 'robot1)
	    (list 'robot 'robot2)
	
	    (list 'at 'robot1 (symbol (format "f%d-%df" 0 (quot size 2))))
	    (list 'at 'robot2 (symbol (format "f%d-%df" (dec size) (quot size 2)))) )))

(defn gen-goal [size]
  (list :goal
	(list 'and
	      (list 'at 'robot1 (symbol (format "f%d-%df" (dec size) (quot size 2))))
	      (list 'at 'robot2 (symbol (format "f%d-%df" 0 (quot size 2)))) )))

(defn gen-decon-problem [size]
  (list 'define (list 'problem (sym-name size))
	(gen-domain size)
	(gen-objects size)
	(gen-init size)
	(gen-goal size) )) 
  

(println (gen-decon-problem 10))
(spit "experiments/decon-gen.pddl" (gen-decon-problem 10))
