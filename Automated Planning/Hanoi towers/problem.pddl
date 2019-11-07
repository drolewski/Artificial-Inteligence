(define (problem hanoitower)
	(:domain hanoitower)
	(:objects
		x y z 
		p1 p2 p3 p4 p5
	)
	(:init
		(pal x)
		(pal y)
		(pal z)
		
		(krazek p1)
		(krazek p2)
		(krazek p3)
		(krazek p4)
		(krazek p5)
		
		(wiekszy p5 p4)
		(wiekszy p5 p3)
		(wiekszy p5 p2)
		(wiekszy p5 p1)

		(wiekszy p4 p3)
		(wiekszy p4 p2)
		(wiekszy p4 p1)
		
		(wiekszy p3 p2)
		(wiekszy p3 p1)
		
		(wiekszy p2 p1)
		
		(na-ziemi p5)
		
		(na p4 p5)
		(na p3 p4)
		(na p2 p3)
		(na p1 p2)
		
		(na-palu p1 x)
		(na-palu p2 x)
		(na-palu p3 x)
		(na-palu p4 x)
		(na-palu p5 x)
		
		
	)
	(:goal	
		(and
			(pal x)
			(pal y)
			(pal z)
			
			(krazek p1)
			(krazek p2)
			(krazek p3)
			(krazek p4)
			(krazek p5)
			
			(wiekszy p5 p4)
			(wiekszy p5 p3)
			(wiekszy p5 p2)
			(wiekszy p5 p1)
	
			(wiekszy p4 p3)
			(wiekszy p4 p2)
			(wiekszy p4 p1)
			
			(wiekszy p3 p2)
			(wiekszy p3 p1)
			
			(wiekszy p2 p1)
			
			(na-ziemi p5)
			
			(na p4 p5)
			(na p3 p4)
			(na p2 p3)
			(na p1 p2)
			
			(na-palu p1 z)
			(na-palu p2 z)
			(na-palu p3 z)
			(na-palu p4 z)
			(na-palu p5 z)
				
		)
	)


)