########################################################
# Joshua Frank
# JOF91
########################################################

.include "constants.asm"
.include "macros.asm"


.global draw_score

.text

# this function draws the scoreboard at the bottom of the screen
draw_score:
	enter
	
	move, s0, a0  # save score value
	move, s1, a1  # save lives value
	
	# draw horizontal line
	#li a0, 0  			  # x
	#li a1, 53 			  # y
	#li a2, 64  			  # width
	#li a3, COLOR_BLUE  # color
	#jal display_draw_hline
	# draw horizontal line
	#li a0, 0  			  # x
	#li a1, 54 			  # y
	#li a2, 64  			  # width
	#li a3, COLOR_BLUE  # color
	#jal display_draw_hline
	# draw horizontal line
	li a0, 0  			  # x
	li a1, 55 			  # y
	li a2, 64  			  # width
	li a3, COLOR_BLUE  # color
	jal display_draw_hline
	
	# draw score text
	li a0, 0  	# top-left x
	li a1, 57  # top-left y
	lstr a2, " PTS: "
	jal display_draw_text
	
	# draw score int value
	li a0, 28  	  # top-left x
	li a1, 57  	  # top-left y
	move a2, s0  # score
	jal display_draw_int
	
	# draw lives int value
	#li a0, 50  	  # top-left x
	#li a1, 57  	  # top-left y
	#move a2, s1  # lives
	#jal display_draw_int
	
	# display lives as player model
	
	# if(lives == 3)
	bne s1, 3, _one_less
	# display player
	la s2, player_model
	li a0, 40
	li a1, 57
	move a2, s2
	jal display_blit_5x5  # displays the player model
	
	li a0, 48
	li a1, 57
	move a2, s2
	jal display_blit_5x5  # displays the player model
	
	li a0, 56
	li a1, 57
	move a2, s2
	jal display_blit_5x5  # displays the player model

_one_less:
	
	# if(lives == 2)
	bne s1, 2, _two_less
	# display player
	la s2, player_model
	li a0, 40
	li a1, 57
	move a2, s2
	jal display_blit_5x5  # displays the player model
	
	li a0, 48
	li a1, 57
	move a2, s2
	jal display_blit_5x5  # displays the player model
	
_two_less:
	# display player
	la s2, player_model
	li a0, 40
	li a1, 57
	move a2, s2
	jal display_blit_5x5  # displays the player model
	
_end:
	
	leave
