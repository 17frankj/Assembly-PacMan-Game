########################################################
# Joshua Frank
# JOF91
########################################################

.include "constants.asm"
.include "macros.asm"

.global enemy_update1
.global enemy_update2
.global enemy_update3
.global current_direction_1
.global current_direction_2
.global current_direction_3

.data
	random_nums: .word 2, 3, 5, 7
	seed: .word 123456 
	repeat: .word 0   # checks if enemy is stuck
	current_direction_1: .byte 0 # 2 for up
								# 3 for down
								# 5 for left
								# 7 for right
	
	current_direction_2: .byte 0 # 2 for up
								# 3 for down
								# 5 for left
								# 7 for right
								
	current_direction_3: .byte 0 # 2 for up
								# 3 for down
								# 5 for left
								# 7 for right

.text

# updates the postion of the enemy 1
enemy_update1:
	enter
	
	# get current frame
	lw s1, frame_counter
	
	# get mod of current frame
	li t7, 2
	div s1, t7
	mfhi t7
	
	# regrab enemy coordinates
	la t0, enemy_inputs_1 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)         # y value
	
	
	# if(frame counter mod 2 == 0)
	bne t7, 0, _safe_right_enemy_11
	

	lw t0, boolean
	# if(boolean == 1)
	bne t0, 1, _cur_0
		# change_direction
		la a0, enemy_inputs_1
		jal change_direction
		sb v0, current_direction_1  # gets new direction based on player movement
		
_cur_0:
	lb s0, current_direction_1

	# if(current_direction_1 == 2)
	bne s0, 2, _cur_1
	
	la, a0, enemy_inputs_1
	jal move_enemy_up       # moves enemy up
	j _safe_right_enemy_11
	
_cur_1:
	# if(current_direction == 3)
	bne s0, 3, _cur_2
	
	la, a0, enemy_inputs_1
	jal move_enemy_down    # moves enemy down
	j _safe_right_enemy_11
	
_cur_2:
	# if(current_direction_1 == 5)
	bne s0, 5, _cur_3
	
	la, a0, enemy_inputs_1
	jal move_enemy_left    # moves enemy to the left
	j _safe_right_enemy_11
	
_cur_3:
	# if(current_direction_1 == 7)
	bne s0, 7, _safe_right_enemy_11

	la, a0, enemy_inputs_1
	jal move_enemy_right   # moves enemy to the right
	

_safe_right_enemy_11:
	
	jal create_enemy       # recreate enemy pixel struct
	move s0, v0
	
	# get inputs again
	la t0, enemy_inputs_1 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)          # y value

	
	move a0, t1    # x 
	move a1, t2    # y
	move a2, s0    # address of enemy pixels
	jal display_blit_5x5  # displays the enemy model
	
_leave_enemy_update_1:
	
	leave
	
enemy_update2:
	enter
	
	# get current frame
	lw s1, frame_counter
	
	# get mod of current frame
	li t7, 2
	div s1, t7
	mfhi t7
	
	# regrab enemy coordinates
	la t0, enemy_inputs_2 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)         # y value
	
	# if(frame counter mod 2 == 0)
	#bne t7, 0, _safe_enemy_2
	
	lw t0, boolean
	# if(boolean == 1)
	bne t0, 1, _cur_0_2
		# change_direction
		la a0, enemy_inputs_2
		jal change_direction
		sb v0, current_direction_2  # gets new direction based on player movement
		
_cur_0_2:
	lb s0, current_direction_2

	# if(current_direction_1 == 2)
	bne s0, 2, _cur_1_2
	
	la, a0, enemy_inputs_2
	jal move_enemy_up       # moves enemy up
	j _safe_enemy_2
	
_cur_1_2:
	# if(current_direction == 3)
	bne s0, 3, _cur_2_2
	
	la, a0, enemy_inputs_2
	jal move_enemy_down    # moves enemy down
	j _safe_enemy_2
	
_cur_2_2:
	# if(current_direction_1 == 5)
	bne s0, 5, _cur_3_2
	
	la, a0, enemy_inputs_2
	jal move_enemy_left    # moves enemy to the left
	j _safe_enemy_2
	
_cur_3_2:
	# if(current_direction_1 == 7)
	bne s0, 7, _safe_enemy_2

	la, a0, enemy_inputs_2
	jal move_enemy_right   # moves enemy to the right
	
_safe_enemy_2:
	jal create_enemy       # recreate enemy pixel struct
	move s0, v0
	
	# get inputs again
	la t0, enemy_inputs_2 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)         # y value

	
	move a0, t1    # x 
	move a1, t2    # y
	move a2, s0    # address of enemy pixels
	jal display_blit_5x5  # displays the enemy model
	
_leave_enemy_update_2:
	leave

enemy_update3:
	enter
	
	# get current frame
	lw s1, frame_counter
	
	# get mod of current frame
	li t7, 2
	div s1, t7
	mfhi t7
	
	# regrab enemy coordinates
	la t0, enemy_inputs_2 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)         # y value
	
	# if(frame counter mod 2 == 0)
	#bne t7, 0, _safe_enemy_2
	
	lw t0, boolean
	# if(boolean == 1)
	bne t0, 1, _cur_0_3
		# change_direction
		la a0, enemy_inputs_3
		jal change_direction
		sb v0, current_direction_3  # gets new direction based on player movement
	
_cur_0_3:
	lb s0, current_direction_3

	# if(current_direction_1 == 2)
	bne s0, 2, _cur_1_3
	
	la, a0, enemy_inputs_3
	jal move_enemy_up       # moves enemy up
	j _leave_enemy3
	
_cur_1_3:
	# if(current_direction == 3)
	bne s0, 3, _cur_2_3
	
	la, a0, enemy_inputs_3
	jal move_enemy_down    # moves enemy down
	j _leave_enemy3
	
_cur_2_3:
	# if(current_direction_1 == 5)
	bne s0, 5, _cur_3_3
	
	la, a0, enemy_inputs_3
	jal move_enemy_left    # moves enemy to the left
	j _leave_enemy3
	
_cur_3_3:
	# if(current_direction_1 == 7)
	bne s0, 7, _leave_enemy3

	la, a0, enemy_inputs_3
	jal move_enemy_right   # moves enemy to the right
	
_leave_enemy3:
	jal create_enemy       # recreate enemy pixel struct
	move s0, v0
	
	# get inputs again
	la t0, enemy_inputs_3 # starting address
	lb t1, (t0)          # x value
	lb t2, 1(t0)         # y value

	
	move a0, t1    # x 
	move a1, t2    # y
	move a2, s0    # address of enemy pixels
	jal display_blit_5x5  # displays the enemy model
	
_leave_again:
	leave
	
# takes a0 as enemy input address
undo_x_right_enemy:
	enter
	# get enemy 1 x value again
	move t0, a0 # starting address
	lb t1, (t0)          # x value
	dec t1  # resets x
	sb t1, (t0)
	
	leave  # go back to draw same postion

# takes a0 as enemy input address
undo_x_left_enemy:
	enter
	# get enemy 1 x value again
	move t0, a0 # starting address
	lb t1, (t0)          # x value
	inc t1 # resets x
	sb t1, (t0)
	
	leave

# takes a0 as enemy input address
undo_y_up_enemy:
	enter
	# get enemy y value again
	move t0, a0 # starting address
	lb t1, 1(t0)          # y value
	inc t1 # resets y
	sb t1, 1(t0)
	
	leave

# takes a0 as enemy input address
undo_y_down_enemy:
	enter
	# get enemy y value again
	move t0, a0 # starting address
	lb t1, 1(t0)          # y value
	dec t1 # resets y
	sb t1, 1(t0)
	
	leave

# takes a0   as the address of enemy inputs
move_enemy_right:
	enter
	# regrab enemy coordinates
	move s7, a0 # starting address
	lb t1, (s7)          # x value
	lb t2, 1(s7)         # y value
	
	addi t1, t1, 1    # increase x by 1 --- go right
	sb t1, (s7)      # store its value
	#lb t1, enemy_inputs_1
	
	move a0, t1  # x
	move a1, t2  # y
	jal check_boundry # checks if enemy will hit a wall, returns 1 if they hit a wall
	
	#(if v0 == 1)
	bne v0, 1, _safe_right_enemy_1
	move a0, s7
	jal undo_x_right_enemy
	
_safe_right_enemy_1:
	
	leave
	
	
# takes a0   as the address of enemy inputs
move_enemy_left:
	enter
	# regrab enemy coordinates
	move s7, a0 # starting address
	lb t1, (s7)          # x value
	lb t2, 1(s7)         # y value
	
	subi t1, t1, 1    # decrease x by 1 --- go left
	sb t1, (s7)      # store its value
	#lb t1, enemy_inputs_1
	
	move a0, t1  # x
	move a1, t2  # y
	jal check_boundry # checks if enemy will hit a wall, returns 1 if they hit a wall
	
	#(if v0 == 1)
	bne v0, 1, _safe_left_enemy_1
	move a0, s7
	jal undo_x_left_enemy
	
_safe_left_enemy_1:
	
	leave

# takes a0   as the address of enemy inputs
move_enemy_down:
	enter
	# regrab enemy coordinates
	move s7, a0 # starting address
	lb t1, (s7)          # x value
	lb t2, 1(s7)         # y value
	
	addi t2, t2, 1    # increase y by 1 --- go down
	sb t2, 1(s7)      # store its value
	#lb t2, enemy_inputs_1
	
	move a0, t1  # x
	move a1, t2  # y
	jal check_boundry # checks if enemy will hit a wall, returns 1 if they hit a wall
	
	#(if v0 == 1)
	bne v0, 1, _safe_down_enemy
	move a0, s7
	jal undo_y_down_enemy

_safe_down_enemy:	
	
	leave

# takes a0   as the address of enemy inputs
move_enemy_up:
	enter
	# regrab enemy coordinates
	move s7, a0 # starting address
	lb t1, (s7)          # x value
	lb t2, 1(s7)         # y value
	
	subi t2, t2, 1    # decrease y by 1 --- go up
	sb t2, 1(s7)      # store its value
	
	move a0, t1  # x
	move a1, t2  # y
	jal check_boundry # checks if enemy will hit a wall, returns 1 if they hit a wall
	
	#(if v0 == 1)
	bne v0, 1, _safe_up_enemy
	move a0, s7
	jal undo_y_up_enemy
	
_safe_up_enemy:
	leave
	
	
# (enemyx - playerx)^2 + (enemyy - playery)^2 = d^2
change_direction:
	enter
	
	# regrab enemy coordinates
	move s7, a0 # starting address
	lb t1, (s7)          # x value
	lb t2, 1(s7)         # y value
	
	# grab player inputs
	la s6, player_inputs
	lb t3, (s6)         # x value
	lb t4, 1(s6)         # y value
	
	# do calculation
	sub t1, t1, t3   # enemy x - player x
	mul t3, t1, t1      # square ^^
	
	sub t2, t2, t4   # enemy y - player y
	mul t4, t2, t2       # square ^^^
	
	add t1, t3, t4   # add totals
	mul t2, t1, t1 # square ^^^
	
	li t2, 2    # get mod 2 of d (t1)
	div t1, t2
	mfhi t2
	
	lw t6, repeat   # get value of repeat to chekc it enemy is stuck
	
	# if(d mod 2 = 0 and repeat == 0)
	bne t2, 0, _mod_3
	bne t6, 0, _else_calc
		# set v0 to 2
		li v0, 2
		# enemy goes up
		li t0, 1
		sw t0, repeat   # set repeat to 1
		j _leave_calulation
		
_mod_3:
	li t2, 3    # get mod 3 of d (t1)
	div t1, t2
	mfhi t2
	
	# if(d mod 3 = 0 and repeat == 0)
	bne, t2, 0, _mod_5
	bne t6, 0, _else_calc
		# set v0 to 3
		li v0, 3
		# enemy goes down
		li t0, 1
		sw t0, repeat   # set repeat to 1
		j _leave_calulation
		
_mod_5:	
	li t2, 5    # get mod 5 of d (t1)
	div t1, t2
	mfhi t2
	
	# if(d mod 5 = 0 and else_calc)
	bne, t2, 0, _mod_7
	bne t6, 0, _else_calc
		# set v0 to 5
		li v0, 5
		# enemy goes left
		li t0, 1
		sw t0, repeat   # set repeat to 1
		j _leave_calulation
_mod_7:
	li t2, 7    # get mod 7 of d (t1)
	div t1, t2
	mfhi t2
	# if(d mod 7 = 0 and repeat == 0)
	bne, t2, 0, _else_calc
	bne t6, 0, _else_calc
		# set v0 to 7
		li v0, 7
		# enemy goes right
		li t0, 1
		sw t0, repeat   # set repeat to 1
		j _leave_calulation

_else_calc:
	# generate random number, 2, 3, 5, or 7
	
	# load seed value
	la t0, seed
	lw t1, 0(t0)
	
	# Generate a pseudo-random index (0 to 3)
	li t2, 4
	li v0, 42  # random num
	syscall
	div v0, t2  # divide random um by 4
	mfhi t3     # get remainder
	
	#find number with index
	la t4, random_nums
	sll t3, t3, 2   # multiply index by 4
	add t4, t4, t3
	lw t5, 0(t4)    # get num from array
	
	move v0, t5
	
	li t0, 0
	sw t0, repeat  # reset repeat
	
	print_str " random value: "
	move a0, v0
	li v0, 1
	syscall
	move v0, a0
	
_leave_calulation:
	la t0, boolean
	li t1, 0
	sw t1, (t0)  # resets hit wall state
	leave
