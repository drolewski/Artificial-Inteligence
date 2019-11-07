(define 
	(domain kupiec)
	(:requirements :adl)
	(:predicates
		(wieksze ?x ?y)
		(ilosc ?typ ?licznosc)
		(wozek ?co ?pozycja)
		(pomocnik-z-kupcem ?numer)
		(sasiaduje ?x ?y)
		(rzad ?x ?y)
		(pole ?x)
		(kupiec ?x)
		(przyprawy ?x)
		(tkanina ?x)
		(owoce ?x)
		(palac ?x)
		(fontanna ?x)
		(targowisko ?x)
		(czarny-rynek ?x)
		(pomocnik ?pole ?nr)
		(pom ?x)
	)
	
	(:action u-sultana
    	:precondition
    	(and
    	    (kupiec ps)
    	    (wozek kawa n1)
    	    (wozek kawa n2)

    	    (exists (?x) (wozek przyprawa ?x))
    	    (exists (?x) (wozek owoce ?x))
    	    (exists (?x) (wozek tkanina ?x))
    	)
    	:effect
    	(and
    	    (wozek rubin n1)
    	)
	)
	
	(:action idz-do-f 
		:parameters(?skad ?dokad ?pompol1 ?pompol2)
		:precondition
		(and
			(kupiec ?skad)
			(not(= ?skad ?dokad))
			(= ?dokad f)
			(pole ?pompol1)
			(pole ?pompol2)
			(pomocnik ?pompol1 p1)
			(pomocnik ?pompol2 p2)
		)
		:effect
		(and
			(not(kupiec ?skad))
			(kupiec ?dokad)
			(pomocnik-z-kupcem p1)
			(pomocnik-z-kupcem p2)
			(not(pomocnik ?pompol1 p1))
			(not(pomocnik ?pompol2 p2))
		)
	)
	
	(:action idz-jeden-pomocnik
		:parameters(?skad ?dokad ?pom)
		:precondition
		(and
			(kupiec ?skad)
			(not(= ?skad ?dokad))
			(sasiaduje ?skad ?dokad)
			(pomocnik ?dokad ?pom)
			(pom ?pom)
		)
		:effect
		(and
			(not (kupiec ?skad))
			(kupiec ?dokad)
			(pomocnik-z-kupcem ?pom)
			(not(pomocnik ?dokad ?pom))
		)
	)
	
	(:action idz-jeden-brak-pomocnika
		:parameters (?skad ?dokad ?pom)
		:precondition
		(and 
			(kupiec ?skad)
			(not(= ?skad ?dokad))
			(sasiaduje ?skad ?dokad)
			(not(exists (?x) (pomocnik ?dokad ?x)))
			(pomocnik-z-kupcem ?pom)
			(pom ?pom)
		)
		:effect
		(and
			(kupiec f)
			(not(kupiec ?skad))
			(when
				(not(= ?dokad f))
				(and (pomocnik ?dokad ?pom) (not(pomocnik-z-kupcem ?pom)))
			)
		)
	)
	
	(:action idz-dwa-pomocnik
		:parameters (?skad ?dokad ?pom)
		:precondition
		(and
			(kupiec ?skad)
			(not (= ?skad ?dokad))
			(rzad ?skad ?dokad)
			(pomocnik ?dokad ?pom)
			(pom ?pom)
		)
		:effect
		(and
			(not(kupiec ?skad))
			(kupiec ?dokad)
			(pomocnik-z-kupcem ?pom)
			(not(pomocnik ?dokad ?pom))
		)
	)
	
	(:action idz-dwa-brak-pomocnik
		:parameters (?skad ?dokad ?pom)
		:precondition
		(and
			(kupiec ?skad)
			(not(=?skad ?dokad))
			(rzad ?skad ?dokad)
			(not(exists (?x) (pomocnik ?dokad ?x)))
			(pomocnik-z-kupcem ?pom)
			(pom ?pom)
		)
		:effect
		(and
			(not(kupiec ?skad))
			(kupiec ?dokad)
			(when
				(not(= ?dokad f))
				(and (pomocnik ?dokad ?pom) (not (pomocnik-z-kupcem ?pom)))
			)
		)
	)
	
	(:action wez-przyprawy
		:parameters (?ilosc)
		:precondition
		(and
			(kupiec sp)
			(ilosc przyprawa ?ilosc)
			(wieksze n3 ?ilosc)
		)
		:effect
		(and
			(when
				(= ?ilosc n0)
				(and (not(ilosc przyprawa ?ilosc)) (ilosc przyprawa n3) (wozek przyprawa n1)
				(wozek przyprawa n2) (wozek przyprawa n3))
			)
			(when
				(= ?ilosc n1)
				(and (not (ilosc przyprawa ?ilosc)) (ilosc przyprawa n2) (wozek przyprawa n1))
			)
			(when
				(= ?ilosc n2)
				(and (not (ilosc przyprawa ?ilosc)) (ilosc przyprawa n3) (wozek przyprawa n3))
			)
		)
	)
	
	(:action wez-czarny-rynek
		:parameters (?iloscP ?iloscO ?iloscT)
		:precondition
		(and
			(kupiec cr)
			(ilosc przyprawa ?iloscP)
			(wieksze ?iloscP n3)
			(ilosc owoce ?iloscO)
			(wieksze ?iloscO n3)
			(ilosc tkanina ?iloscT)
			(wieksze ?iloscT n3)
		)
		:effect
		(and
			
    		(when 
        		(= ?iloscP n0) 
        		(and (not (ilosc przyprawa ?iloscP)) (ilosc przyprawa n1) (wozek przyprawa n1))
        	)
        	(when 
        		(= ?iloscP n1) 
        		(and (not (ilosc przyprawa ?iloscP)) (ilosc przyprawa n2) (wozek przyprawa n2))
        	)
        	(when 
        		(= ?iloscP n2) 
        		(and (not (ilosc przyprawa ?iloscP)) (ilosc przyprawa n3) (wozek przyprawa n3))
        	)
        	(when 
        		(= ?iloscO n0) 
        		(and (not (ilosc owoce ?iloscO)) (ilosc owoce n1) (wozek owoce n1))
        	)
        	(when 
        		(= ?iloscO n1) 
        		(and (not (ilosc owoce ?iloscO)) (ilosc owoce n2) (wozek owoce n2))
        	)
        	(when 
        		(= ?iloscO n2) 
        		(and (not (ilosc owoce ?iloscO)) (ilosc owoce n3) (wozek owoce n3))
        	)
        	(when 
        		(= ?iloscT n0) 
        		(and (not (ilosc tkanina ?iloscT)) (ilosc tkanina n1) (wozek tkanina n1))
        	)
        	(when 
        		(= ?iloscT n1) 
        		(and (not (ilosc tkanina ?iloscT)) (ilosc tkanina n2) (wozek tkanina n2))
        	)
        	(when 
        		(= ?iloscT n2) 
        		(and (not (ilosc tkanina ?iloscT)) (ilosc tkanina n3) (wozek tkanina n3))
        	)
		)
	)
	
	(:action wez-owoc
		:parameters(?ilosc)
		:precondition
		(and
			(kupiec so)
			(ilosc owoce ?ilosc)
			(wieksze ?ilosc n3)
		)
		:effect
		(and
			(when
				(= ?ilosc n0)
				(and (not(ilosc owoce ?ilosc)) (ilosc owoce n3) (wozek owoce n1)
				(wozek owoce n2) (wozek owoce n3))
			)
			(when
				(= ?ilosc n1)
				(and (not (ilosc owoce ?ilosc)) (ilosc owoce n2) (wozek owoce n1))
			)
			(when
				(= ?ilosc n2)
				(and (not (ilosc owoce ?ilosc)) (ilosc owoce n3) (wozek owoce n3))
			)
		)
	)
	
	(:action wez-tkanina
    	:parameters (?ilosc)
    	:precondition
    	(and
    	    (kupiec so)
    	    (ilosc tkanina ?ilosc)
    	    (wieksze ?ilosc n3)
    	)
    	:effect
    	(and
    		(when 
        		(= ?ilosc n0) 
        		(and (not (ilosc tkanina ?ilosc)) (ilosc tkanina n3) (wozek tkanina n1) (wozek tkanina n2) 
        		(wozek tkanina n3) )
        	)
        	(when 
        		(= ?ilosc n1) 
        		(and (not (ilosc tkanina ?ilosc)) (ilosc tkanina n3) (wozek tkanina n2)  (wozek tkanina n3))
        	)
        	(when 
        		(= ?ilosc n2) 
        		(and (not (ilosc tkanina ?ilosc)) (ilosc tkanina n3) (wozek tkanina n3))
        	)
    	)
	)
	
	(:action sprzedaj-przyprawa
		:parameters (?ilosc)
		:precondition
		(and
			(kupiec t)
			(wozek przyprawa n1)
			(wozek przyprawa n2)
			(wozek przyprawa n3)
			(ilosc kawa ?ilosc)
		)
		:effect
		(and
			(not (wozek przyprawa n1))
    	    (not (wozek przyprawa n2))
    	    (not (wozek przyprawa n3))
    	    (not (ilosc przyprawa n3))
    	    (ilosc przyprawa n0)
    	    (when 
        		(= ?ilosc n0) 
        		(and (not (ilosc kawa ?ilosc)) (ilosc kawa n1) (wozek kawa n2))
        	)
        	(when 
        		(= ?ilosc n1) 
        		(and (not (ilosc kawa ?ilosc)) (ilosc kawa n2) (wozek kawa n2))
        	)
		)
	)
		
	(:action sprzedaj-tkanina
    	:parameters (?ilosc)
    	:precondition
    	(and
    	    (kupiec t)
    	    (wozek tkanina n1)
    	    (wozek tkanina n2)
    	    (wozek tkanina n3)
    	    (ilosc kawa ?ilosc)
    	)
    	:effect
    	(and
    	    (not (wozek tkanina n1))
    	    (not (wozek tkanina n2))
    	    (not (wozek tkanina n3))
    	    (not (ilosc tkanina n3))
    	    (ilosc tkanina n0)
    	    (when 
        		(= ?ilosc n0) 
        		(and (not (ilosc kawa ?ilosc)) (ilosc kawa n1) (wozek kawa n1))
        	)
        	(when 
        		(= ?ilosc n1) 
        		(and (not (ilosc kawa ?ilosc)) (ilosc kawa n2) (wozek kawa n2))
        	)
    	)
    	)
    	
    	(:action sprzedaj-owoce
    	:parameters (?ilosc)
    	:precondition
    	(and
    	    (kupiec t)
    	    (wozek owoce n1)
    	    (wozek owoce n2)
    	    (wozek owoce n3)
    	    (ilosc kawa ?ilosc)
    	)
    	:effect
    	(and
    	    (not (wozek owoce n1))
    	    (not (wozek owoce n2))
    	    (not (wozek owoce n3))
    	    (not (ilosc owoce n3))
    	    (ilosc owoce n0)
    	    (when 
        		(= ?ilosc n0) 
        		(and (not (ilosc kawa ?ilosc)) (ilosc kawa n1) (wozek kawa n1))
        	)
        	(when 
        		(= ?ilosc n1) 
        		(and (not (ilosc kawa ?ilosc)) (ilosc kawa n2) (wozek kawa n2))
        	)
    	)
	)
	
	
	
)