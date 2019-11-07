(define 
	(domain sokoban)
	(:requirements :adl)
	(:predicates
		(poziomo ?x ?y)
		(pionowo ?x ?y)
		(paczka ?paczka)
		(cel ?pole)
		(robot ?pole)
		
	)
	
	(:action idz
		:parameters(?skad ?dokad)
		:precondition
		(and
			(or
				(poziomo ?skad ?dokad)
				(pionowo ?skad ?dokad)
			)
			(not (= ?skad ?dokad))
			(robot ?skad)
			(not(paczka ?dokad))
			(not(paczka ?skad))
			
		)
		:effect
		(and
			(robot ?dokad)
			(not(robot ?skad))
		)
	)
	
	(:action pchaj
		:parameters(?skad ?dokad ?paczka)
		:precondition
		(and
			(robot ?skad)
			(paczka ?dokad)
			(or
				(and
					(pionowo ?skad ?dokad)
					(pionowo ?dokad ?paczka)
					(not(= ?skad ?paczka))
				)
				(and
					(poziomo ?skad ?dokad)
					(poziomo ?dokad ?paczka)
					(not(= ?skad ?paczka))
				)
			)		
			(not(= ?dokad ?paczka))
			(not(paczka ?paczka))
			(not(= ?skad ?dokad))
			
		)
		:effect
		(and
			(not(robot ?skad))
			(robot ?dokad)
			(paczka ?paczka)
			(not(paczka ?dokad))
		)
	)
	
)