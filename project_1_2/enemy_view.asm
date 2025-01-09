########################################################
# Joshua Frank
# JOF91
########################################################

.include "constants.asm"
.include "macros.asm"

.global enemy_model

.data
	enemy_model: .space 24    # 0-24 pixel colors

.text

.global create_enemy
create_enemy:
	enter
	
	la s2, enemy_model
	
	####################### row 1
	
	# array[i] = red
	li t1, COLOR_RED
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = red
	li t1, COLOR_RED
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = red
	li t1, COLOR_RED
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = red
	li t1, COLOR_RED
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = red
	li t1, COLOR_RED
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	########################### row 2
	
	# array[i] = red
	li t1, COLOR_RED
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = red
	li t1, COLOR_RED
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = red
	li t1, COLOR_RED
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = red
	li t1, COLOR_RED
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = red
	li t1, COLOR_RED
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	############################### row 3
	
	# array[i] = blue
	li t1, COLOR_BLUE
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = blue
	li t1, COLOR_BLUE
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	##################################### row 4
	
	# array[i] = green 
	li t1, COLOR_GREEN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = green 
	li t1, COLOR_GREEN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = green 
	li t1, COLOR_GREEN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = green 
	li t1, COLOR_GREEN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = green 
	li t1, COLOR_GREEN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	##################################  row 5
	
	# array[i] = green 
	li t1, COLOR_GREEN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = green 
	li t1, COLOR_GREEN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	la v0, enemy_model # return orginal start address
	

	leave
