########################################################
# Joshua Frank
# JOF91
########################################################

.include "constants.asm"
.include "macros.asm"

.global player_inputs
.global death
.global player_enemy_collision

.data
	player_inputs: .space 2 	# 0 x value
								# 1 y value
								# 2 button press
	delay: .word 0
	death: .word 0  # boolean for if player hit enemy
	
.text

.global draw_player

draw_player:
	enter
	
	jal create_player
	move s2, v0
	
	la s3, player_inputs # starting address
	lb s4, (s3)          # x value
	lb s5, 1(s3)         # y value
	
	# if( x == 0)        # only paints player at starting position at the begining 
	bne s4, 0, _skip1
	li t0, 30
	sb t0, (s3)   # starts player at middle of board
	sb t0, 1(s3)

_skip1:

	# updates the position of the player based on button presses
	jal player_update
	
	la s2, player_model  # reload player model address in s2
	la s3, player_inputs # reload starting address in s3
	lb t0, (s3) # get new x
	lb t1, 1(s3) # get new y
	
	la t3, enemy_hit   # sets enemy hit value to false
	li t4, 0
	sb t4, (t3)
	
	# check if cookie has been hit
	move a0, t0
	move a1, t1
	jal hit_cookie_check
	
	# restore x and y variables 
	lb t0, (s3) # get new x
	lb t1, 1(s3) # get new y
	
	
	lw t5, death
	# if( death == 1)
	bne t5, 1, _skip2
		move a0, t0
		move a1, t1
		jal invincible   # make player invincible 
		j leave1
		
_skip2:
	# restore x and y variables 
	lb t0, (s3) # get new x
	lb t1, 1(s3) # get new y
	
	# display player
	move a0, t0
	move a1, t1
	move a2, s2
	jal display_blit_5x5  # displays the player model
	
leave1:

	leave
	
	
invincible:
	enter
	
	# retain player values
	move t4, a0
	move t5, a1
	
	# get delay
	la t0, delay
	lw t1, delay
	
	# get mod of delay
	li t2, 2
	div t1, t2
	mfhi t2
	
	move a0, t2
	li v0, 1
	syscall
	move t2, a0
	
	# if( delay is mod 0)
	bne t2, 0, _inv_skip
		# draw player 
		# display player
		move a0, t4
		move a1, t5
		la a2, player_model
		jal display_blit_5x5  # displays the player model
		
_inv_skip:
	# get delay
	la t0, delay
	lw t1, delay
	addi t1, t1, 1
	sw t1, (t0)
	
	# if delay is over 300 (60 x 5 seconds)
	ble t1, 300, _inv_end
		# reset delay to 0
		li t3, 0
		sw t3, (t0)
		# reset death to 0
		la t0, death
		li t1, 0
		sw t1, (t0)
		
_inv_end:
	
	leave

player_enemy_collision:
	enter
	
	
	lw t0, death
	# if (death != 1)
	bne t0, 0, _leave_coll
	
	# get player inputs
	la t0, player_inputs
	lb t1, (t0) # x
	lb t2, 1(t0) # y
	
	# get enemy 1 inputs
	la t3, enemy_inputs_1
	lb t4, (t3)  # x
	lb t5, 1(t3) # y
	
	# check enemy 1 -----------
	# if(player.x == enemy.x and player.y == enemy.y)
	bne t1, t4, _check_enemy2
	bne t2, t5, _check_enemy2
		# dec lives
		la t4, lives
		lw t5, (t4)  
		dec t5      # lives - 1
		sw t5, (t4)
		# death = 1
		la t4, death
		lw t5, (t4)
		inc t5     # death + 1
		sw t5, (t4)

_check_enemy2:	
	# get enemy 2 inputs
	la t3, enemy_inputs_2
	lb t4, (t3)  # x
	lb t5, 1(t3) # y
	
	# check enemy 2 ----------
	# if(player.x == enemy.x and player.y == enemy.y)
	bne t1, t4, _check_enemy3
	bne t2, t5, _check_enemy3
		# dec lives
		la t4, lives
		lw t5, (t4)  
		dec t5      # lives - 1
		sw t5, (t4)
		# death = 1
		la t4, death
		lw t5, (t4)
		inc t5     # death + 1
		sw t5, (t4)
		
_check_enemy3:
	# get enemy 3 inputs
	la t3, enemy_inputs_3
	lb t4, (t3)  # x
	lb t5, 1(t3) # y
	
	# check enemy 3 -------- 
	# if(player.x == enemy.x and player.y == enemy.y)
	bne t1, t4, _leave_coll
	bne t2, t5, _leave_coll
		# dec lives
		la t4, lives
		lw t5, (t4)  
		dec t5      # lives - 1
		sw t5, (t4)
		# death = 1
		la t4, death
		lw t5, (t4)
		inc t5     # death + 1
		sw t5, (t4)

_leave_coll:
	
	leave
