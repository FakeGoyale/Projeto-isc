.data

STR: .string "Digite um número:"
PAR: .string " é par!"
IMPAR: .string " é ímpar!"
QNT_NOTAS_PAR: .word 7
NOTAS_PAR: .word 76,150,76,300,76,300,72,150,76,300,79,600,55,600
QNT_NOTAS_IMPAR: .word 21
NOTAS_IMPAR: .word 72,526,76,350,77,350,81,175,79,526,76,350,72,350,69,175,65,175,65,175,65,175,67,1052,65,174,65,174,65,174,67,174,70,526,72,175,72,175,72,175,72,175


.text
   
	# Pede um numero ao usuário
	la a0, STR
	li a7, 4
	ecall
	#ler o numero digitado
	li a7, 5
	ecall

	# Verificar se o número é par ou ímpar
	li t1, 2
	rem t2, a0, t1
	beqz t2, Ehpar
	j Ehimpar

Ehpar:
	# Exibir a mensagem de número par
	la a0, PAR
	li a7, 4
	ecall
	j ReproduzirPar

Ehimpar:
	# Exibir a mensagem de número ímpar
	la a0, IMPAR
	li a7, 4
	ecall
	j ReproduzirImpar

ReproduzirPar:
	# Reproduzir a melodia de Super Mario Bros. para números pares
	la s0 QNT_NOTAS_PAR
	lw s1,0(s0)
	la s0, NOTAS_PAR
	li t0, 0
	li a2, 1
	li a3, 127

LoopPar:
	beq t0, s1, FIM
	lw a0, 0(s0)
	lw a1, 4(s0)
	li a7, 31
	ecall
	mv a0, a1
	li a7, 32
	ecall
	addi s0, s0, 8
	addi t0, t0, 1
	j LoopPar

ReproduzirImpar:
	# Reproduzir a melodia de The Simpsons para números ímpares
	la s0 QNT_NOTAS_IMPAR
	lw s1,0(s0)
	la s0, NOTAS_IMPAR
	li t0, 0
	li a2, 1
	li a3, 127

LoopImpar:
	beq t0, s1, FIM
	lw a0, 0(s0)
	lw a1, 4(s0)
	li a7, 31
	ecall
	mv a0, a1
	li a7, 32
	ecall
	addi s0, s0, 8
	addi t0, t0, 1
	j LoopImpar

FIM:
	# Fim do programa
	li a7, 10
	ecall
	