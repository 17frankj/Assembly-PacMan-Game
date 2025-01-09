########################################################
# Joshua Frank
# JOF91
########################################################

.include "constants.asm"
.include "macros.asm"

.global boolean

.data
	boolean: .word 0

.text

.global check_boundry

# takes a0 = x value
# takes a1 = y value

# returns 1 if in wall, 0 if not
check_boundry:
	enter
	
	la s0, boolean  # resets boolean value at start
	li t0, 0
	sw t0, (s0)
	
	move s1, a0   # x
	move s2, a1    # y
	
	# checks outter walls
	move a0, s1
	move a1, s2
	jal check_walls
	
	# checks if player hits top left square
	move a0, s1
	move a1, s2
	jal check_left_square
	
	# check if player hits middle square
	move a0, s1
	move a1, s2
	jal check_middle_square
	
	# checks if player hits top right L
	move a0, s1
	move a1, s2
	jal check_top_right_L
	
	# checks if player hits two single squares
	#jal check_single_squares
	
	# checks if player hits bottom right L
	move a0, s1
	move a1, s2
	jal check_bottom_right_L
	
	# checks if player hits left L
	move a0, s1
	move a1, s2
	jal check_left_L
	
	# checks if player hits middle bottom rectange
	move a0, s1
	move a1, s2
	jal check_middle_rectangle
	
	lw v0, boolean  # returns 1 if in wall, 0 otherwise
	
	#li v0, 0
	leave


check_walls:
	enter
	
	la s0, boolean  # boolean
	move s1, a0  # x
	move s2, a1  # y
	
	# check ride wall
		
		# x cant be 51
		bne s1, 51, _check_left_wall
		# and y cant be between 0 and 64
		blt s2, 0, _check_left_wall
		ble s2, 64, _in_wall_outer
			# return boolean == 1 if in wall
	
_check_left_wall:
	# x cant be 4
		bne s1, 4, _check_top_wall
		# and y cant be between 0 and 64
		blt s2, 0, _check_top_wall
		ble s2, 64, _in_wall_outer
			# return boolean == 1 if in wall

_check_top_wall:
	# check top
			# and y cant be 6
			bne s2, 4, _check_bottom_wall
			# x cant be between 6 and 19
			blt s1, 0, _check_bottom_wall
			ble s1, 64, _in_wall_outer
		# return boolean == 1 if in wall	
_check_bottom_wall:
	# check bottom
		# y cant be 46
		bne s2, 46, _not_in_wall_outer
		# x cant be between 0 and 64
		blt s1, 0, _not_in_wall_outer
		ble s1, 64, _in_wall_outer
			# return boolean == 1 if in wall
	
_in_wall_outer:
	li t0, 1
	sw t0, (s0) # sets boolean as 1 for in wall
	
_not_in_wall_outer:
	
	leave
	

check_left_square:
	enter
	
	la s0, boolean  # boolean
	move s1, a0  # x
	move s2, a1  # y
	
# check left side
		
		# x cant be 6
		bne s1, 6, _check_right_side_sq1
		# and y cant be between 6 and 19
		blt s2, 6, _check_right_side_sq1
		ble s2, 19, _in_wall_left_sq
			# return boolean == 1 if in wall
	
_check_right_side_sq1:
	# check right side
				# x cant be 19
				bne s1, 19, _check_bottom_left_sq
				# and y cant be between 6 and 19
				blt s2, 6, _check_bottom_left_sq
				ble s2, 19, _in_wall_left_sq
			# return boolean == 1 if in wall
		
_check_bottom_left_sq:
	# check bottom
				# y cant be 19
				bne s2, 19, _check_top_sq
				# x cant be between 6 and 19
				blt s1, 6, _check_top_sq
				ble s1, 19, _in_wall_left_sq
			# return boolean == 1 if in wall
	
_check_top_sq:
	# check top
			# and y cant be 6
			bne s2, 6, _not_in_wall_left_sq
			# x cant be between 6 and 19
			blt s1, 6, _not_in_wall_left_sq
			bge s1, 19, _not_in_wall_left_sq
		# return boolean == 1 if in wall	

_in_wall_left_sq:
	li t0, 1
	sw t0, (s0) # sets boolean as 1 for in wall
	
_not_in_wall_left_sq:

	leave
	
	
check_middle_square:
	enter
	
	la s0, boolean  # boolean
	move s1, a0  # x
	move s2, a1  # y
	
# check left side
		
		# x cant be 21
		bne s1, 21, _check_right_side_sq2
		# and y cant be between 11 and 24
		blt s2, 11, _check_right_side_sq2
		ble s2, 24, _in_wall_mid_sq
			# return boolean == 1 if in wall
	
	
_check_right_side_sq2:
	# check right side
		# x cant be 34
		bne s1, 34, _check_bottom_mid_sq
		# and y cant be between 11 and 24
		blt s2, 11, _check_bottom_mid_sq
		ble s2, 24, _in_wall_mid_sq
			# return boolean == 1 if in wall
		
_check_bottom_mid_sq:
	# check bottom
		# y cant be 24
		bne s2, 24, _check_top_sq2
		# x cant be between 21 and 34
		blt s1, 21, _check_top_sq2
		ble s1, 34, _in_wall_mid_sq
			# return boolean == 1 if in wall
	
_check_top_sq2:
# check top
		# and y cant be 11
		bne s2, 11, _not_in_wall_mid_sq
		# x cant be between 21 and 34
		blt s1, 21, _not_in_wall_mid_sq
		bge s1, 34, _not_in_wall_mid_sq
			# return boolean == 1 if in wall	
	
_in_wall_mid_sq:
	li t0, 1
	sw t0, (s0) # sets boolean as 1 for in wall

_not_in_wall_mid_sq:

	leave


check_top_right_L:
	enter
	
	la s0, boolean  # boolean
	move s1, a0  # x
	move s2, a1  # y

# check left side
		
		# x cant be 36 or 41
		bne s1, 36, _46_check2
		# and y cant be between 11 and 19
		blt s2, 11, _46_check2
		ble s2, 19, _in_wall_right_L
			# return boolean == 1 if in wall

_46_check2:
			# cant be 41 
			bne s1, 41, _check_right_side_right_L
			# and y cant be between 21 and 44
			blt s2, 6, _check_right_side_right_L
			ble s2, 11, _in_wall_right_L
				# return boolean == 1 if in wall

_check_right_side_right_L:
	# check right side
		# x cant be 49
		bne s1, 49, _check_bottom_top_right_L
		# and y cant be between 6 and 19
		blt s2, 6, _check_bottom_top_right_L
		ble s2, 19, _in_wall_right_L
			# return boolean == 1 if in wall
		
_check_bottom_top_right_L:
	# check bottom
		# y cant be 19
		bne s2, 19, _check_top_top_right_L
		# x cant be between 36 and 49
		blt s1, 36, _check_top_top_right_L
		ble s1, 49, _in_wall_right_L
			# return boolean == 1 if in wall
	
_check_top_top_right_L:
	# check top
		# check bottom
		# y stays same
			# y cant be 11
			bne s2, 11, _check_other_bottom_L2
			# and x cant be between 41 and 49
			blt s1, 36, _check_other_bottom_L2
			ble s1, 41, _in_wall_right_L
		# return boolean == 1 if in wall

_check_other_bottom_L2:

			# y cant be 6
			bne s2, 6, _not_in_wall_right_L
			# x cant be between 41 and 49
			blt s1, 41, _not_in_wall_right_L
			ble s1, 49, _in_wall_right_L
		# return boolean == 1 if in wall
		
		j _not_in_wall_right_L
	
_in_wall_right_L:
	li t0, 1
	sw t0, (s0) # sets boolean as 1 for in wall
	
_not_in_wall_right_L:

	leave



check_single_squares:
	enter
	
	
	leave
	
check_bottom_right_L:
	enter
	
	la s0, boolean  # boolean
	move s1, a0  # x
	move s2, a1  # y

# check left side
		# increase x by 5
		addi s1, s1, 5
		
		# x cant be 41 or 46
		bne s1, 41, _46_check
		# and y cant be between 21 and 29
		blt s2, 21, _46_check
		ble s2, 29, _in_wall_bottom_right
			# return boolean == 1 if in wall

_46_check:
			# cant be 46 
			bne s1, 46, _check_right_side

_y_21_44:
			# and y cant be between 21 and 44
			blt s2, 21, _check_right_side
			ble s2, 44, _in_wall_bottom_right
				# return boolean == 1 if in wall

_check_right_side:
	# check right side
		# x stays the same
		subi s1, s1, 5
			# cant be 50
			bne s1, 49, _check_bottom_right_L
			# and y cant be between 26 and 45
			blt s2, 21, _check_bottom_right_L
			ble s2, 44, _in_wall_bottom_right
		# return boolean == 1 if in wall

_check_bottom_right_L:
	# check bottom
		# y stays same
			# y cant be 44
			bne s2, 44, _check_other_bottom_L
			# and x cant be between 45 and 49
			blt s1, 41, _check_other_bottom_L     ######## potential issue with going through coordinates x: 47 y: 44
			ble s1, 49, _in_wall_bottom_right
		# return boolean == 1 if in wall

_check_other_bottom_L:

			# y cant be 29
			bne s2, 29, _check_top_right_LL
			# x cant be between 41 and 46
			blt s1, 36, _check_top_right_LL
			ble s1, 49, _in_wall_bottom_right
		# return boolean == 1 if in wall
		
_check_top_right_LL:

	# check top
			# and y cant be 25
			bne s2, 21, _not_in_wall_bottom_right
			# x cant be between 45 and 49
			blt s1, 36, _not_in_wall_bottom_right
			bge s1, 50, _not_in_wall_bottom_right
		# return boolean == 1 if in wall
		
_in_wall_bottom_right:
	li t0, 1
	sw t0, (s0) # sets boolean as 1 for in wall
	
_not_in_wall_bottom_right:
	
	leave
	
check_left_L:
	enter
	
	la s0, boolean  # boolean
	move s1, a0  # x
	move s2, a1  # y
	
# check left side
		
		# x cant be 11 or 15
		bne s1, 6, _15_check
		# and y cant be between 26 and 34
		blt s2, 26, _15_check
		ble s2, 34, _in_wall_left_L
			# return boolean == 1 if in wall

_15_check:
			# cant be 21
			bne s1, 16, _check_right_left_L
			# and y cant be between 36 and 41
			blt s2, 33, _check_right_left_L
			ble s2, 39, _in_wall_left_L
				# return boolean == 1 if in wall
				
_check_right_left_L:
	# check right side
			# x cant be 24
			bne s1, 24, _check_bottom_left_L
			# and y cant be between 26 and 39
			blt s2, 26, _check_bottom_left_L
			ble s2, 39, _in_wall_left_L
		# return boolean == 1 if in wall
		
_check_bottom_left_L:
	# check bottom
		# y stays same
			# y cant be 39
			bne s2, 39, _check_other_bottom_left_L
			# and x cant be between 16 and 24
			blt s1, 16, _check_other_bottom_left_L
			ble s1, 24, _in_wall_left_L
		# return boolean == 1 if in wall

_check_other_bottom_left_L:
	# y stays same
			# y cant be 34
			bne s2, 34, _check_top_left_L
			# and x cant be between 6 and 16
			blt s1, 6, _check_top_left_L
			ble s1, 16, _in_wall_left_L
		# return boolean == 1 if in wall
		
_check_top_left_L:
	# y stays same
			# y cant be 26
			bne s2, 26, _not_in_wall_left_L
			# and x cant be between 6 and 24
			blt s1, 6, _not_in_wall_left_L
			ble s1, 24, _in_wall_left_L
		# return boolean == 1 if in wall
		j _not_in_wall_left_L
	
_in_wall_left_L:
	li t0, 1
	sw t0, (s0) # sets boolean as 1 for in wall
	
_not_in_wall_left_L:
	
	leave
	
check_middle_rectangle:
	enter
	
	la s0, boolean  # boolean
	move s1, a0  # x
	move s2, a1  # y
	
# check left side
		# increase x by 5
		addi s1, s1, 5
		
		# x cant be 26
		bne s1, 26, _check_right_side_rec
		# and y cant be between 36 and 45
		blt s2, 36, _check_right_side_rec
		ble s2, 44, _in_wall_rec
			# return boolean == 1 if in wall
		
_check_right_side_rec:
	# check right side
		# x stays the same
		subi s1, s1, 5
			# x cant be 36
			bne s1, 34, _check_bottom_rec
			# and y cant be between 36 and 44
			blt s2, 36, _check_bottom_rec
			ble s2, 44, _in_wall_rec
		# return boolean == 1 if in wall

_check_bottom_rec:
	# check bottom
			# y cant be 44
			bne s2, 44, _check_top_rec
			# x cant be between 26 and 36
			blt s1, 22, _check_top_rec
			ble s1, 34, _in_wall_rec
		# return boolean == 1 if in wall
		

_check_top_rec:
	# check top
			# and y cant be 36
			bne s2, 36, _not_in_wall_rec
			# x cant be between 22 and 34
			blt s1, 22, _not_in_wall_rec
			bge s1, 34, _not_in_wall_rec
		# return boolean == 1 if in wall
	
_in_wall_rec:
	li t0, 1
	sw t0, (s0) # sets boolean as 1 for in wall
	
_not_in_wall_rec:

	leave
			

