########################################################
# Joshua Frank
# JOF91
########################################################

.include "constants.asm"
.include "macros.asm"

.global enemy_inputs_1
.global enemy_inputs_2
.global enemy_inputs_3

.global draw_enemy_1
.global draw_enemy_2
.global draw_enemy_3

.data
	enemy_inputs_1: .byte 5, 5 # x value 5       
								# y value 5 
								
	enemy_inputs_2: .byte 5, 45 # x value 5
								# y value 5
								
	enemy_inputs_3: .byte 50, 45 # x value 5
								# y value 5
	start: .word 1  # checks if its the first frame for the enemy
	start2: .word 1  # checks if its the first frame for the enemy
	start3: .word 1  # checks if its the first frame for the enemy
		
.text

draw_enemy_1:
	enter
	
	# create enemy model
	jal create_enemy
	move s0, v0
		
	######################################  enemy 1
	la t0, enemy_inputs_1 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)         # y value
	lw t3, start          # start boolean
	
	
	#if(start == 1)
	beq t3, 1, _skip_enemy_1
	
	jal enemy_update1       # updates enemy location
	
	# regrab enemy coordinates
	la t0, enemy_inputs_1 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)         # y value
	
	la t3, enemy_hit   # sets enemy hit value to true
	li t4, 1
	sb t4, (t3)
	
	# check if cookie has been hit
	move a0, t1
	move a1, t2
	jal hit_cookie_check
	
	j _end_enemy_1
	
	# display enemy  / starting place
_skip_enemy_1:
	la t4, start
	li t0, 0
	sw t0, (t4)   # change start condiition to false
	
	# enemy one always starts by going right
	la t0, current_direction_1
	li, t1, 7
	sb t1, (t0)
	
	# get inputs again
	la t0, enemy_inputs_1 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)
	
	
	move a0, t1    # x 
	move a1, t2    # y
	move a2, s0    # address of enemy pixels
	jal display_blit_5x5  # displays the enemy model

_end_enemy_1:
	leave
	
	#######################  enemy 2
draw_enemy_2:
	enter
	
	# create enemy model
	jal create_enemy
	move s0, v0
	
	la t0, enemy_inputs_2 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)         # y value
	
	#if(start == 1)
	beq t3, 1, _skip_enemy_2

	jal enemy_update2        # updates enemy location
	
	# regrab enemy coordinates
	la t0, enemy_inputs_2 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)         # y value
	
	la t3, enemy_hit   # sets enemy hit value to true
	li t4, 1
	sb t4, (t3)
	
	# check if cookie has been hit
	move a0, t1
	move a1, t2
	jal hit_cookie_check
	
	j _end_enemy_2

_skip_enemy_2:
	la t4, start2
	li t0, 0
	sw t0, (t4)   # change start condiition to false
	
	# enemy one always starts by going up
	la t0, current_direction_2
	li, t1, 2
	sb t1, (t0)
	
	# get inputs again
	la t0, enemy_inputs_2 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)
	
	# display enemy
	move a0, t1    # x 
	move a1, t2    # y
	move a2, s0    # address of enemy pixels
	jal display_blit_5x5  # displays the enemy model
	
_end_enemy_2:
	leave

	###################### enemy 3
draw_enemy_3:
	enter
	
	# create enemy model
	jal create_enemy
	move s0, v0
	
	la t0, enemy_inputs_3 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)         # y value
	
	#if(start == 1)
	beq t3, 1, _skip_enemy_3

	jal enemy_update3        # updates enemy location
	
	# regrab enemy coordinates
	la t0, enemy_inputs_3 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)         # y value
	
	la t3, enemy_hit   # sets enemy hit value to true
	li t4, 1
	sb t4, (t3)
	
	# check if cookie has been hit
	move a0, t1
	move a1, t2
	jal hit_cookie_check
	
	j _end_enemy_3
	
_skip_enemy_3:

	la t4, start3
	li t0, 0
	sw t0, (t4)   # change start condiition to false
	
	# enemy one always starts by going left
	la t0, current_direction_3
	li, t1, 5
	sb t1, (t0)
	
	# get inputs again
	la t0, enemy_inputs_3 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)
	
	# display enemy
	move a0, t1    # x 
	move a1, t2    # y
	move a2, s0    # address of enemy pixels
	jal display_blit_5x5  # displays the enemy model

_end_enemy_3:

	leave
	

	
