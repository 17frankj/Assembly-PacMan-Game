########################################################
# Joshua Frank
# JOF91
########################################################

.include "constants.asm"
.include "macros.asm"

.global player_update

.data
	horizontal: .byte 78  # center of board array
	vertical: .byte 78    # center of board array
.text

# updates the postion of the player based on the input
player_update:
	enter
	
	la s5, player_inputs  # gets begining of player inputs array
	lb s6, (s5)           # get x value
	lb s7, 1(s5)          # get y value
	
	# Load button states into registers
    lw t3, up_pressed       # Load 'up' button state into t3
    lw t4, down_pressed     # Load 'down' button state into t4
    lw t5, left_pressed     # Load 'left' button state into t5
    lw t6, right_pressed    # Load 'right' button state into t6
    
    # get vertical and horizontal values
    la s4, boundry_board  # gets address of first value

   
	# basic move for testing logic
	bne t3, 1, _if2
	# if up_pressed == 1
		dec s7
		
		move a0, s6  # x
		move a1, s7  # y
		jal check_boundry # checks if player will hit a wall, returns 1 if they hit a wall
		
		beq v0, 1, _undo_y_up
		sb s7, 1(s5) # lowers y
		j _if5
_if2:
	# if down_pressed == 1
	bne t4, 1, _if3
		inc s7
		
		move a0, s6  # x
		move a1, s7  # y
		jal check_boundry # checks if player will hit a wall, returns 1 if they hit a wall
		
		beq v0, 1, _undo_y_down
		sb s7, 1(s5) # raises y
		j _if5
_if3:
	# if left_pressed == 1
	bne t5, 1, _if4
		dec s6
		
		move a0, s6  # x
		move a1, s7  # y
		jal check_boundry # checks if player will hit a wall, returns 1 if they hit a wall
		
		beq v0, 1, _undo_x_left
		sb s6, (s5)
		j _if5
_if4:
	# if right_pressed == 1
	bne t6, 1, _if5
		inc s6        # increaes x by 1
		
		move a0, s6  # x
		move a1, s7  # y
		jal check_boundry # checks if player will hit a wall, returns 1 if they hit a wall
		
		beq v0, 1, _undo_x
		sb s6, (s5)
		j _if5
_undo_x:
	dec s6  # resets x
	la s5, player_inputs  # gets begining of player inputs array
	sb s6, (s5)
	j _if5
	
_undo_x_left:
	inc s6 # resets x
	la s5, player_inputs  # gets begining of player inputs array
	sb s6, (s5)
	j _if5
	
_undo_y_up:
	inc s7 # resets y
	la s5, player_inputs  # gets begining of player inputs array
	sb s7, 1(s5)
	j _if5

_undo_y_down:
	dec s7 # resets y
	la s5, player_inputs  # gets begining of player inputs array
	sb s7, 1(s5)

_if5:
	
	
	leave
