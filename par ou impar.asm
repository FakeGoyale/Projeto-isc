.data #indica que as strings a seguir estão armazenados em na memoria/segmento de dados 
STR: 	.string "Digite um numero:"#atribui a string a label 'STR'
PAR: 	.string " eh par!" #atribi a string a label 'PAR'
IMPAR: 	.string " eh impar!" #atribi a string a label 'IMPAR'
.text #indica que o codigo a seguir está armazenado na memoria/segmento de texto
	la a0,STR #carrega a label STR no registrador a0
	li a7,4 #carrega o numero 4 no registrador a7
	ecall #executa a system call especificada pelo valor em a7, neste caso, 'print string'
	li a7,5 #carrega o numero 5 no registrador a7
	ecall #executa a system call especificada pelo valor em a7, neste caso, 'read integer'
	li a7,1 #carrega o numero 1 no registrador a7
	ecall #executa a system call especificada pelo valor em a7, neste caso, 'print integer'
	li t1,2 #carrega o numero imediato 2 no registrador t1
	rem t2,a0,t1 #carrega o resto da divisão entre os valores dos registradores a0 e t1 no registrador t2
	beq t2,zero,Ehpar #pula para a lable 'Ehpar' caso t2 seja igual a zero
	la a0,IMPAR #carrega a lable 'IMPAR' no registrador a0
	j Mostra #pula para a label 'Mostra'
Ehpar:  la a0,PAR #carrega a label 'PAR' no endereço a0, e atribui a label 'Ehpar'
Mostra: li a7,4 #carrega o numero 4 no registrador a7, e atribui a label 'Mostra'
	ecall #executa a system call especificada pelo valor em a7, neste caso, 'print string'
	li a7,10 #carrega o numero 10 no registrador a7
	ecall #executa a system call especificada pelo valor em a7, neste caso, 'exit'