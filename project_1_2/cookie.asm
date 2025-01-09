########################################################
# Joshua Frank
# JOF91
########################################################

.include "constants.asm"
.include "macros.asm"

.global cookie_1
.global cookie_2
.global cookie_3
.global cookie_4
.global cookie_5
.global cookie_6

.data
	cookie_1: .word 1 	# 0 alive state, 0 or 1
	cookie_2: .word 1	# 0 alive state, 0 or 1
	cookie_3: .word 1  	# 0 alive state, 0 or 1
	cookie_4: .word 1  # 0 alive state, 0 or 1
	cookie_5: .word 1  # 0 alive state, 0 or 1
	cookie_6: .word 1  # 0 alive state, 0 or 1
	
.text

.global draw_cookie

draw_cookie:
	enter
	
	jal create_cookie
	jal create_cookie_2
	
	la s2, cookie_model
	la s3, cookie_model_2
	
	# get current frame
	lw s1, frame_counter
	
	# get mod of current frame
	li s7, 61
	div s1, s7
	mfhi s7
	
	
								####### cookie 1
	lw t0, cookie_1
	# if(cookie_1 == 1)
	bne t0, 1 _cookie_2
	
	# if( s7 == 0)
	bne s7, 0, _skip_cookie_1
	
	# display cookie
	li a0, 15    # x value
	li a1, 5    # y value
	move a2, s2   # address of cookie colors
	jal display_blit_5x5  # displays the cookie model
	j _cookie_2
	
_skip_cookie_1:
	# display cookie
	li a0, 15    # x value
	li a1, 5    # y value
	move a2, s3   # address of cookie colors
	jal display_blit_5x5  # displays the cookie model
	
								####### cookie 2
_cookie_2:
	lw t0, cookie_2
	# if(cookie_2 == 1)
	bne t0, 1, _cookie_3
	
	# if( s7 == 0)
	bne s7, 0, _skip_cookie_2
	
	# display cookie
	li a0, 25    # x value
	li a1, 10    # y value
	move a2, s2   # address of cookie colors
	jal display_blit_5x5  # displays the cookie model
	j _cookie_3
	
_skip_cookie_2:
	# display cookie
	li a0, 25    # x value
	li a1, 10    # y value
	move a2, s3   # address of cookie colors
	jal display_blit_5x5  # displays the cookie model
	
								####### cookie 3
_cookie_3:
	lw t0,cookie_3
	# if(cookie_3 == 1)
	bne t0, 1, _cookie_4
	
	# if( s7 == 0)
	bne s7, 0, _skip_cookie_3
	
	# display cookie
	li a0, 40    # x value
	li a1, 30    # y value
	move a2, s2   # address of cookie colors
	jal display_blit_5x5  # displays the cookie model
	j _cookie_4
	
_skip_cookie_3:
	# display cookie
	li a0, 40    # x value
	li a1, 30    # y value
	move a2, s3   # address of cookie colors
	jal display_blit_5x5  # displays the cookie model


							####### cookie 4
_cookie_4:
	lw t0,cookie_4
	# if(cookie_4 == 1)
	bne t0, 1, _cookie_5
	
	# if( s7 == 0)
	bne s7, 0, _skip_cookie_4
	
	# display cookie
	li a0, 10    # x value
	li a1, 25    # y value
	move a2, s2   # address of cookie colors
	jal display_blit_5x5  # displays the cookie model
	j _cookie_5
	
_skip_cookie_4:
	# display cookie
	li a0, 10    # x value
	li a1, 25    # y value
	move a2, s3   # address of cookie colors
	jal display_blit_5x5  # displays the cookie model
	
							####### cookie 5
	
_cookie_5:
	lw t0,cookie_5
	# if(cookie_5 == 1)
	bne t0, 1, _cookie_6
	
	# if( s7 == 0)
	bne s7, 0, _skip_cookie_5
	
	# display cookie
	li a0, 15    # x value
	li a1, 35    # y value
	move a2, s2   # address of cookie colors
	jal display_blit_5x5  # displays the cookie model
	j _cookie_6
	
_skip_cookie_5:
	# display cookie
	li a0, 15    # x value
	li a1, 35    # y value
	move a2, s3   # address of cookie colors
	jal display_blit_5x5  # displays the cookie model
	
							####### cookie 6
	
_cookie_6:
	lw t0,cookie_6
	# if(cookie_5 == 1)
	bne t0, 1, _cookie_leave
	
	# if( s7 == 0)
	bne s7, 0, _skip_cookie_6
	
	# display cookie
	li a0, 50    # x value
	li a1, 5    # y value
	move a2, s2   # address of cookie colors
	jal display_blit_5x5  # displays the cookie model
	j _cookie_leave
	
_skip_cookie_6:
	# display cookie
	li a0, 50    # x value
	li a1, 5    # y value
	move a2, s3   # address of cookie colors
	jal display_blit_5x5  # displays the cookie model
	
_cookie_leave:
	
	leave
