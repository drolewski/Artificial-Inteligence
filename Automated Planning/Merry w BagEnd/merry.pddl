(define 
	(domain merry)
	(:requirements :adl)
	(:predicates
		(pokoj ?x)
		(klucz ?klucz ?pokoj)
		(drzwi ?skad ?dokad ?kolor)
		(sasiaduje ?pole1 ?pole2)
		(bohater ?pokoj)
		(pozycja ?klocek ?pole)
		(wolne ?pole)	
		(plecak ?x)
	)
	
	(:action wez
		:parameters (?kolor ?skad)
		:precondition
		(and
			(pokoj ?skad)
			(bohater ?skad)
			(klucz ?kolor ?skad)
		)
		:effect
		(and
			(plecak ?kolor)
			(not (klucz ?kolor ?skad))
		)
	)
	
	(:action idz
		:parameters (?dokad ?skad ?kolor)
		:precondition
		(and
			(pokoj ?skad)
			(pokoj ?dokad)
			(bohater ?skad)
			(not(= ?skad ?dokad))
			(plecak ?kolor)
			(drzwi ?skad ?dokad ?kolor)
			
		)
		:effect
		(and
			(bohater ?dokad)
			(not (plecak ?kolor))
			(not (bohater ?skad))
		)
	)
	
	(:action przesun
		:parameters (?co ?skad ?gdzie)
		:precondition
		(and
			(bohater a)
			(wolne ?gdzie)
			(sasiaduje ?skad ?gdzie)
			(not (= ?skad ?gdzie))
			(pozycja ?co ?skad)
		)
		:effect
		(and
			(wolne ?skad)
			(not(wolne ?gdzie))
			(pozycja ?co ?gdzie)
			(not (pozycja ?co ?skad))
		)
	)
	
)