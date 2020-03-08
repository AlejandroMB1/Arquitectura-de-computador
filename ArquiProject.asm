 #PROGRAMA DE MANEJO DE PERIODO EN MUJERES
 
	.text 

Main:

	addi $s0,$0, 19 #edad
	addi $s1,$0, 25 #duraciondiclo
	addi $s2,$0, 3 #diasultimezperiodo
	addi $s3,$0, 10 #diasultimarelacion
	addi $s4,$0, 5 #diasduracionperiodo
	addi $s5,$0, 0 #planifica (1/0)
	addi $s6,$0, 1 #estaperiodo (1/0)
	
ProxPeriodo:
	beq $s1,0,Prox #Si la duracionciclo es igual a 0 salta a Prox
	sub $t0, $s1,$s2 #De lo contrario proxperiodo = duracionciclo - diasultimavezperiodo
	j PeriodoFertil
Prox:
	mul $s1,$s1,-1
 	addi $t0,$s1,28 #Proximo periodo = 28 - diasultimavezperiodo
 	
PeriodoFertil:
	blez $s1,DurCi #Si duracion ciclo es igual a 0 salta a Durci
	beq $s5,1,PeFer #Si planifica es 1 salta a PeFer
	beq $s6,1,PeFer2 # Si estaperiodo es 1 salta a PeFer2
	beq $s6,0,PeFer3 #Si estaPeriodo es igual a 0
	
PeFer3:
	bgt $s2,10,PeFer4 #Si s6 = 0 y diasUltimaVez > 10
	blt $s2,10,PeFer6 #Si S6 = 0 y diasUltimaVez < 10
	bge $s2,17,PeFer7 #Si S6 = 0 y diasUltimaVez >= 17
PeFer4:
	blt $s2,17,PeFer5 #Si S6 = 0 y S2 > 10 y S2 < 17
	j PeFer7
PeFer5:
	addi $t1,$t1,1 #Esta en su periodo fertil
	j Menopausia
PeFer6:
	mul $s2,$s2,-1
	addi $t1,$s2,10 #faltan t1 dias para su periodo fertil
	j Menopausia
PeFer7:
	sub $t1,$s1,$s2 #Duracionciclo-DiasUltimaVez
	add $t1,$t1,$s4 #(Duracionciclo-DiasUltimaVez)+diasDuracionPeriodo
	addi $t1,$t1,7  #((S1+S2)+S4)+7
	j Menopausia
	
PeFer2:
	sub $t1,$s4,$s2 # Perfe = diasduracionperiodo - diasultimavez
	addi $t1,$t1,7 # Perfe = Perfe + 7
	j Menopausia
PeFer:
	addi $t1,$0,0 #No tendrá periodo fertil
	j Menopausia

DurCi:
	addi $s1,$0,28 #Duracion ciclo tendrá un promedio de 28 dias 
	j PeriodoFertil
	
Menopausia:
	bgt $s0,50,meno2 #Si la edad es mayor a 50 salta a meno2
	mul $s0,$s0,-1
	addi $t2,$s0,51 #Años faltantes para tener menopausia
	j Alertas
meno2:
	addi $t2,$0,1 #Se le asigna uno porque esta prox a la menopausia

Alertas:
	blez $s1,Alerta2 #Si duracion ciclo es igual a 0 salta a Alerta2
	add $t3,$s1,$s4 #Suma duracionCiclo + diasDuracionPeriodo de la condicion
	addi $t3,$t3,7 #Suma la suma anterior mas 7 de la condicion
	bge $s2,$t3,Alerta3 #Compara si diasUltimaVez >= (duracionCiclo + diasDuracionPeriodo + 7) se cumple y salta a Alerta3
	j Alerta6
	
 Alerta3:
 	beq $s5,0,Alerta4 #Si no planifica salta a Alerta5 a revisar la ultima condicion
 	j Alerta6
 		
 Alerta4:
 	blt $s3,15,Alerta5 #Si los dias de la ultima relacion son menores que 15 salta a Alerta5 porque se cumple la ultima condicion
 	j Alerta6
 		
 Alerta2:
 	addi $s1,$0,28 #Duracion ciclo tendrá un promedio de 28 dias 
	j Alertas
 	
Alerta5:
 	addi $t3,$0,0 #0 debido a que activa alerta de embarazo	
 	j Fin
 	
Alerta6:
	bgt $s2,88, Alerta7
	addi $t3,$0,2 #2 debido a que no activa ninguna alerta
	j Fin
	
Alerta7:
	addi $t3,$0,1 #1 debido a que activa alerta de retraso

 	
Fin:	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
