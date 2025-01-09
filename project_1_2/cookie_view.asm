########################################################
# Joshua Frank
# JOF91
########################################################

.include "constants.asm"
.include "macros.asm"

.global cookie_model
.global cookie_model_2

.data
	cookie_model: .space 24    # 0-24 pixel colors
	cookie_model_2: .space 24   # 0-24 pixel colors
	
.text

.global create_cookie
.global create_cookie_2

create_cookie:
	enter
	
	la s2, cookie_model
	
	##################### top row 
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
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
	
	###########################  second row
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	################################   third row
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = white
	li t1, COLOR_WHITE
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	##################################   fourth row
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	#################################  last row
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
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

	
	la v0, cookie_model # return orginal start address
	
	leave


create_cookie_2:
	enter
	
	la s2, cookie_model_2
	
	##################### top row 
	
	# array[i] = white
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = white
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	###########################  second row
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	################################   third row
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = BLACK
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	##################################   fourth row
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	#################################  last row
	
	# array[i] = white
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = brown
	li t1, COLOR_BROWN
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = black
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte
	
	# array[i] = WHITE
	li t1, COLOR_BLACK
	sb t1, (s2)
	addi s2, s2, 1  # go to next byte

	
	la v0, cookie_model_2 # return orginal start address
	
	
	
	
	
	
	
	
	leave