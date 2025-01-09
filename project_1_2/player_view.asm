########################################################
# Joshua Frank
# JOF91
########################################################

.include "constants.asm"
.include "macros.asm"

.global player_model

.data
	player_model: .space 24    # 0-24 pixel colors

.text

.global create_player
create_player:
	enter
	
	la s2, player_model
	
	# array[i] = white
	li t1, COLOR_WHITE
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = white
	li t1, COLOR_WHITE
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = white
	li t1, COLOR_WHITE
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = white
	li t1, COLOR_WHITE
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = white
	li t1, COLOR_WHITE
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
	
	# array[i] = white
	li t1, COLOR_WHITE
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
	
	# array[i] = white
	li t1, COLOR_WHITE
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = blue
	li t1, COLOR_BLUE
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = white
	li t1, COLOR_WHITE
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = blue
	li t1, COLOR_BLUE
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = white
	li t1, COLOR_WHITE
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = red
	li t1, COLOR_RED
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = white
	li t1, COLOR_WHITE
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = white
	li t1, COLOR_WHITE
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = white
	li t1, COLOR_WHITE
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
	
	# array[i] = red
	li t1, COLOR_RED
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = red
	li t1, COLOR_RED
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	la v0, player_model # return orginal start address
	
	leave
