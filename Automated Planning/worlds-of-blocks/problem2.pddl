(define (problem world-of-blocks)
	(:domain world-of-blocks)
	(:objects
		a b c d e f g h
	)
	(:init		
		(na-ziemi a)
		(na-ziemi b)
		(na-ziemi c)
		(na-ziemi d)
		(na-ziemi e)
		(na-ziemi f)
		(na-ziemi g)
		(na-ziemi h)
	)
	(:goal
		(and
			(na-ziemi a)
			(na b a)
			(na c b)
			(na d c)
			(na e d)
			(na f e)
			(na g f)
			(na h g)
		)
	)
)