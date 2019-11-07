(define (problem kupiec)
	(:domain kupiec)
	(:objects
		n0 n1 n2 n3 kawa tkanina przyprawa owoce rubin
		p1 p2
		cr sp t f ps st so
	)
	(:init
		(wieksze n2 n3)
		(wieksze n1 n3)
		(wieksze n0 n3)
		(wieksze n1 n2)
		(wieksze n0 n2)
		(wieksze n0 n1)
		(pom p1)
		(pom p2)
		
		(ilosc kawa n0)
		(ilosc tkanina n0)
		(ilosc przyprawa n0)
		(ilosc owoce n2)
		(ilosc rubin n0)
		
		(wozek owoce n1)
		(wozek owoce n2)
		
		(pomocnik-z-kupcem p1)
		(pomocnik-z-kupcem p2)
		
		(sasiaduje cr sp)
		(sasiaduje sp cr)
		(sasiaduje sp t)
		(sasiaduje t sp)
		(sasiaduje sp f)
		(sasiaduje f sp)
		(sasiaduje f st)
		(sasiaduje st f)
		(sasiaduje st ps)
		(sasiaduje ps st)
		(sasiaduje so st)
		(sasiaduje st so)
		
		(rzad cr t)
		(rzad t cr)
		(rzad sp st)
		(rzad st sp)
		(rzad ps so)
		(rzad so ps)
		
		(pole cr)
		(pole sp)
		(pole t)
		(pole f)
		(pole ps)
		(pole st)
		(pole so)
		
		(kupiec f)
		
		(przyprawy sp)
		(owoce so)
		(tkanina st)
		(czarny-rynek cr)
		(targowisko t)
		(fontanna f)
		(palac ps)
		
	)
	(:goal
		(and
			(kupiec ps)
			(wozek rubin n1)
		)
	)

)