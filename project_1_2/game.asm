########################################################
# Joshua Frank
# JOF91
########################################################

.include "constants.asm"
.include "macros.asm"

.global points
.global lives
.global cookie_counter

.data
	lives: .word 3
	points: .word 0
	cookie_counter: .word 6
	
.globl game
.text


game:
	enter

# loop to check if player wants to begin the game
_start_while:
	# if(player hits key break out)
	jal check_keys
	beq, v0, 1, _game_while
	
	jal	handle_input
	
	li	a0, 4
	li	a1, 10
	# This is a macro defined in macros.asm
	lstr	a2, " Start "
	jal	display_draw_text
	
	li	a0, 15
	li	a1, 30
	# This is a macro defined in macros.asm
	lstr	a2, " Game? "
	jal	display_draw_text
	
	jal	display_update_and_clear
	jal	wait_for_next_frame
	
	j _start_while

_game_while:
	
	#(if cookie_count != 0)  # ends game if cookies are gone
	lw t0, cookie_counter
	beq t0, 0, _bypass
	
	# Checks for input
	#	left_pressed
	#	right_pressed
	#	up_pressed
	#	down_pressed
	#	b_pressed
	#	z_pressed
	#	x_pressed
	#	c_pressed
	jal	handle_input
	
	
	# check if lives are 0
	lw t0, lives
	bne t0, 0, _continue
	
_bypass:
	li	a0, 5
	li	a1, 5
	# This is a macro defined in macros.asm
	lstr	a2, "Game Over! :("
	jal	display_draw_text
	
	li a0, 5
	li a1, 20
	lstr	a2, "Score: "
	jal display_draw_text
	
	li a0, 50
	li a1, 20
	lw a2, points
	jal	display_draw_int
	
	# check if lives are 0 or cokies are gone
	lw t0, lives
	lw t1, cookie_counter
	beq t0, 0, _leave_if_x
	beq t1, 0, _leave_if_x
	
_continue:

	# draw board
	jal draw_board
	
	# draw / move player
	jal draw_player
	
	# draw / move enemy
	jal draw_enemy_1
	jal draw_enemy_2
	jal draw_enemy_3
	
	# draw cookies
	jal draw_cookie

	# check player / enemy collision
	jal player_enemy_collision
	
	# draw score
	lw a0, points
	lw a1, lives
	jal draw_score
	
	j _continue2
	#li	a0, 5
	#li	a1, 5
	# This is a macro defined in macros.asm
	#lstr	a2, "Press x"
	#jal	display_draw_text

	#li	a0, 11
	#li	a1, 11
	## This is a macro defined in macros.asm
	#lstr	a2, "to exit"
	#jal	display_draw_text

	# Must update the frame and wait
	#jal	display_update_and_clear
	#jal	wait_for_next_frame

_leave_if_x:
	# Leave if x was pressed
	lw	t0, x_pressed
	bnez	t0, _game_end
	
_continue2:
	# Must update the frame and wait
	jal	display_update_and_clear
	jal	wait_for_next_frame
	
	#jal	display_draw_text
	
	j	_game_while

_game_end:
	# Clear the screen
	jal	display_update_and_clear
	jal	wait_for_next_frame

	leave
	
check_keys:
	enter
	
	# Check for key states
	lw	t2, up_pressed
	beq t2, 1, _leave_press
	
	lw	t2, down_pressed
	beq t2, 1, _leave_press
	
	lw	t2, left_pressed
	beq t2, 1, _leave_press
	
	lw	t2, right_pressed
	beq t2, 1, _leave_press
	
	lw	t2, b_pressed
	beq t2, 1, _leave_press
	
	lw	t2, z_pressed
	beq t2, 1, _leave_press
	
	lw	t2, x_pressed
	beq t2, 1, _leave_press
	
	lw	t2, c_pressed
	beq t2, 1, _leave_press
	
_leave_press:
	move v0, t2
	leave
