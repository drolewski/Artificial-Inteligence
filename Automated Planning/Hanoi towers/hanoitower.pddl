(define 
	(domain hanoitower)
	(:requirements :adl)
	(:predicates 
		(krazek ?krazek)
		(pal ?pal)
		(wiekszy ?wiekszy ?mniejszy)
		(na-ziemi ?x)
		(na ?krazekNa ?krazekPod)
		(na-palu ?krazek ?pal)
	)
	
	(:action przesun-na-pusty
		:parameters( ?skad ?dokad ?krazek)
		:precondition
		(and
			(krazek ?krazek)
			(pal ?skad)
			(pal ?dokad)
			(not(exists (?x) (na ?x ?krazek)))
			(na-palu ?krazek ?skad)
			(not(na-palu ?krazek ?dokad))
			(not (= ?skad ?dokad))
			(not(exists (?x) (na-palu ?x ?dokad)))
		)
		:effect
		(and
			(na-ziemi ?krazek)
			(na-palu ?krazek ?dokad)
			(not(na-palu ?krazek ?skad))
			(forall (?x) (not(na ?krazek ?x)))
		)
	)
	
	(:action przesun-na-krazek
		:parameters (?skad ?dokad ?krazekmniejszy ?krazekwiekszy)
		:precondition
		(and
			(pal ?skad)
			(pal ?dokad)
			(krazek ?krazekmniejszy)
			(krazek ?krazekwiekszy)
			(not(= ?skad ?dokad))
			(not(= ?krazekmniejszy ?krazekwiekszy))
			
			(wiekszy ?krazekwiekszy ?krazekmniejszy)
			(not(exists (?x) (na ?x ?krazekmniejszy)))
			(not(exists (?x) (na ?x ?krazekwiekszy)))
			(na-palu ?krazekmniejszy ?skad)
			(na-palu ?krazekwiekszy ?dokad)
		)
		:effect
		(and
			(na ?krazekmniejszy ?krazekwiekszy)
			(not(na-palu ?krazekmniejszy ?skad))
			(na-palu ?krazekmniejszy ?dokad)
			(forall (?x) (not(na ?krazekmniejszy ?x)))
		)
	) 
)