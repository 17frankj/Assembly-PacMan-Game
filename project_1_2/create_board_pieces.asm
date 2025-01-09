########################################################
# Joshua Frank
# JOF91
########################################################

.include "constants.asm"
.include "macros.asm"

.text

.global create_wall
create_wall:
	enter
	# get address of first value
	move s2, a0
	#move s3, s2
	
	li s0, 0   # current = 0
	li s1, 0   # i = 0
	
	# for(int i = 0; i < 25; i++)
_for_top:
	bgt s1, 25, _for_exit
		# array[i] = grey
		li t1, COLOR_LIGHT_GREY
		sb t1, (s2)
		addi s2, s2, 1  # go to next byte
		
		# array[i] = red
		li t1, COLOR_BLACK
		sb t1, (s2)
		addi s2, s2, 1  # go to next byte
		
		# current = i
		move s0, s1
		
		# i++
		inc s1
		j _for_top
_for_exit:
	# array[current] = 1
	li t0, 1
	#sw t0, (s2)           ##### not sure why this causes crashes
	
_exit_wall:
	move v0, s2 # return orginal start address
	
	leave
