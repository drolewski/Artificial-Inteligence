(define 
	(domain world-of-blocks)
	(:requirements :adl) 
	(:predicates
		(na ?na ?pod)
		(na-ziemi ?paczka)
		(arm ?paczka)
	)
	
	;get from the floor
	(:action podnies-z-ziemi
		:parameters (?paczka)
		:precondition
		(and
			(not(exists (?x) (arm ?x)))
			(na-ziemi ?paczka)
			(not(exists (?x) (na ?x ?paczka)))
		)
		:effect
		(and
			(arm ?paczka)
			(not(na-ziemi ?paczka))
		)
	)
	
	;get from the box
	(:action podnies-z-paczki
		:parameters (?paczka ?z)
		:precondition
		(and
			(not(exists (?x) (arm ?x)))
			(not(exists (?x) (na ?x ?paczka)))
			(na ?paczka ?z)
			(not(= ?paczka ?z))
		)
		:effect
		(and
			(not(na ?paczka ?z))
			(arm ?paczka)
		)	
	)
	
	;drop on the floor
	(:action opusc-na-ziemie
		:parameters (?paczka)
		:precondition
		(and
			(arm ?paczka)
		)
		:effect
		(and
			(na-ziemi ?paczka)
			(not(arm ?paczka))
		)
	)
	
	;drop on the another block
	(:action opusc-na-paczke
		:parameters(?paczka ?na)
		:precondition
		(and
			(arm ?paczka)
			(not(= ?paczka ?na))
			(not (arm ?na))
			(not(exists (?x) (na ?x ?na)))
		)
		:effect
		(and
			(not(arm ?paczka))
			(na ?paczka ?na)
		)
	)
)