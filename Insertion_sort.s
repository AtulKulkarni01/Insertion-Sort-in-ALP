#inserion sort
.data
arr:	.word   -8,0,777,45,5,2

.text
main:
		la   s0, arr 
		addi t0, x0, 5     # initial n
		addi t1, x0 ,0     # initial i
		jal  ra, Loopi
        li a7 10
        ecall

Loopi:
		addi t1, t1, 1     # i++
		slli t4, t1, 2     # get the address of data[i]
		add  s1, s0, t4is 
		lw   t5, 0(s1)     # t5=data[i]
		add  t3, t5, x0    # temp=data[i]
		addi t2, t1, -1    # j=i-1
		blt  t1, t0, Loopj # if(i < n)
		
		
Loopj:
        bgt t1 t0 exit
		slli t4, t2, 2     # get the address of data[j]
		add  s1, s0, t4
		lw   t6, 0(s1)     # t6=data[j]
		blt  t2, x0, Loopi # if(j < 0) leave Loopj
		bge  t3, t6, Loopi # if(temp >= data[j]) leave Loopj
		sw   t6, 4(s1)     # data[j+1] = data[j]
		sw   t3, 0(s1)     # data[j] = temp
		addi t2, t2, -1    # j--
        
		j    Loopj

exit:
    nop