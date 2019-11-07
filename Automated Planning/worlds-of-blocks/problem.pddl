(define (problem world-of-blocks)
	(:domain world-of-blocks)
	(:objects
		a b c d e
	)
	(:init		
		(na-ziemi a)
		(na-ziemi d)
		
		(na b a)
		(na c b)
		(na e d)
	)
	(:goal
		(and
			(na d b)
			(exists (?x) (na b ?x))
		)
	)
	
	

)