########################################################
# Joshua Frank
# JOF91
########################################################

.include "constants.asm"
.include "macros.asm"

.global boundry_board

.data

	walls_array: .space 25
	boundry_board: .byte 1,1,1,1,1,1,1,1,1,1,1,1
					.byte 1,0,0,0,0,0,1,0,0,0,0,1
					.byte 1,0,1,1,0,0,0,0,0,1,0,1
					.byte 1,0,1,1,0,1,1,0,1,1,0,1
					.byte 1,0,0,0,0,1,1,0,0,0,0,1
					.byte 1,0,0,0,0,0,0,0,1,1,0,1
					.byte 1,0,1,1,1,0,0,0,0,1,0,1
					.byte 1,0,0,0,1,0,0,0,0,1,0,1
					.byte 1,0,1,0,0,1,1,0,0,1,0,1
					.byte 1,0,0,0,0,0,0,0,0,0,0,1
					.byte 1,1,1,1,1,1,1,1,1,1,1,1
	
.global draw_board

.text

draw_board:
	enter
	
	la s0, walls_array  # load base address
	
	# create wall
	move a0, s0
	jal create_wall
	
	# draw wall   // test function
	#li a0, 5    # top-left x
	#li a1, 30   # top-left y
	#la a2, walls_array   #  pointer to pattern (an array of 25 bytes stored row-by-row)
	#jal display_blit_5x5
	
	
	li s5, 0   # x
	li s6, 0   # y
	# create board area
	jal row1
	jal row2
	jal row3
	jal row4
	jal row5
	jal row6
	jal row7
	jal row8
	jal row9
	jal row10
	jal row11

_leave:
	leave

create_and_draw:
	enter
	
	# display wall
	move a0, s5
	move a1, s6
	la a2, walls_array
	jal display_blit_5x5  # displays the wall

_leave_create_and_draw:
	leave

row1:
	enter
	li s7, 0  # i = 0
	# for(int i = 0; i <= walls_array.size; i++)
_outer_for_top:
	#341
	bgt s7, 11, _leave_walls
	
	# row 1
	jal create_and_draw
	addi s5, s5, 5
	
	inc s7  #i ++
	j _outer_for_top

_leave_walls:
	leave
	
row2:
	enter
	
	li s5, 0 # reset x value
	li s6, 5  # change y value to 5
	
	li s7, 0  # i = 0
	# for(int i = 0; i <= walls_array.size; i++)
_row2_for_top:
	bgt s7, 11, _leave_row2
	# if(j == 0 || j == 6 || j == 11)
		bne s7, 0, _or_row2_2
		# create wall and display wall
		jal create_and_draw	
		addi s5, s5, 10   # 5
		j _else_row2
		
_or_row2:                        # cut this piece
		bne s7, 6, _or_row2_2
		# create wall and display wall
		jal create_and_draw
		addi s5, s5, 5
		j _else_row2
		
_or_row2_2:
		bne s7, 9, _else_row2
		# create wall and display wall
		jal create_and_draw
		addi s5, s5, 5
		
_else_row2:
		# else
		addi s5, s5, 5
			# create empty space
			# draw empty space
	inc s7
	j _row2_for_top

_leave_row2:
	leave
			
row3:
	enter
	
	li s5, 0 # reset x value
	li s6, 10  # change y value to 10
	
	li s7, 0  # i = 0
	# for(int i = 0; i <= walls_array.size; i++)
_row3_for_top:
	bgt s7, 11, _leave_row3

	#row 3
	# if(j != 0 || j != 8 || j != 10)
	bne s7, 0, _row3_or1
		# create wall and display wall
		jal create_and_draw	
		j _row3_else

_row3_or1:
	bne s7, 2, _row3_or2
	# create wall and display wall
		jal create_and_draw	
		j _row3_else
	
_row3_or2:
	bne s7, 3, _row3_or3
	# create wall and display wall
		jal create_and_draw	
		j _row3_else
		
_row3_or3:
	bne s7, 9, _row3_or4
	# create wall and display wall
		jal create_and_draw	
		j _row3_else
		
_row3_or4:
	bne s7, 11, _row3_else
	# create wall and display wall
		jal create_and_draw	
		j _row3_else

	# else
_row3_else:
		# create empty space
		# draw empty space
	addi s5, s5, 5  # need to still inc to go to next x value
	inc s7
	j _row3_for_top

_leave_row3:
	leave
	
row4:
	# row 4
	enter
	
	li s5, 0 # reset x value
	li s6, 15  # change y value to 15
	
	li s7, 0  # i = 0
	# for(int i = 0; i <= walls_array.size; i++)
_row4_for_top:
	bgt s7, 11, _leave_row4

	#row 4
	# if(j == 1 || j == 4 || j == 9 || j == 11)
	bne s7, 1, _row4_or1
		# dont create a wall
		j _row4_else

_row4_or1:
	bne s7, 4, _row4_or2
		# dont create a wall
		j _row4_else
	
_row4_or2:
	bne s7, 7, _row4_or3
		# dont create a wall
		j _row4_else
		
_row4_or3:
	bne s7, 10, _row4_build
		# dont create a wall
		j _row4_else

	# else
_row4_build:
	# make a wall
	jal create_and_draw
	
_row4_else:
	
	addi s5, s5, 5  # need to still inc to go to next x value
	inc s7
	j _row4_for_top

_leave_row4:
	leave

row5:
	# row 5
	enter
	
	li s5, 0 # reset x value
	li s6, 20  # change y value to 15
	
	li s7, 0  # i = 0
	# for(int i = 0; i <= walls_array.size; i++)
_row5_for_top:
	bgt s7, 11, _leave_row5

	#row 4
	# if(j == 1 || j == 4 || j == 9 || j == 11)
	bne s7, 0, _row5_or1
		jal create_and_draw
		j _row5_else

_row5_or1:
	bne s7, 5, _row5_or2
		jal create_and_draw
		j _row5_else
	
_row5_or2:
	bne s7, 6, _row5_or3
		jal create_and_draw
		j _row5_else
		
_row5_or3:
	bne s7, 11, _row5_else
		jal create_and_draw
		j _row5_else

	# else
	
_row5_else:
	
	addi s5, s5, 5  # need to still inc to go to next x value
	inc s7
	j _row5_for_top

_leave_row5:
	leave

row6:
	# row 6
	enter
	
	li s5, 0 # reset x value
	li s6, 25  # change y value to 25
	
	li s7, 0  # i = 0
	# for(int i = 0; i <= walls_array.size; i++)
_row6_for_top:
	bgt s7, 11, _leave_row6

	#row 4
	# if(j == 0 || j == 8 || j == 9 || j == 11)
	bne s7, 0, _row6_or1
		jal create_and_draw
		j _row6_else

_row6_or1:
	bne s7, 8, _row6_or2
		jal create_and_draw
		j _row6_else
	
_row6_or2:
	bne s7, 9, _row6_or3
		jal create_and_draw
		j _row6_else
		
_row6_or3:
	bne s7, 11, _row6_else
		jal create_and_draw
		j _row6_else

	# else
	
_row6_else:
	
	addi s5, s5, 5  # need to still inc to go to next x value
	inc s7
	j _row6_for_top

_leave_row6:
	leave
	
row7:
	# row 6
	enter
	
	li s5, 0 # reset x value
	li s6, 30  # change y value to 30
	
	li s7, 0  # i = 0
	# for(int i = 0; i <= walls_array.size; i++)
_row7_for_top:
	bgt s7, 11, _leave_row7

	#row 4
	# if(j == 0 || j == 2 || j == 3 || j == 4 || j == 9 || j == 11)
	bne s7, 0, _row7_or1
		jal create_and_draw
		j _row7_else

_row7_or1:
	bne s7, 2, _row7_or2
		jal create_and_draw
		j _row7_else
	
_row7_or2:
	bne s7, 3, _row7_or3
		jal create_and_draw
		j _row7_else
		
_row7_or3:
	bne s7, 4, _row7_or4
		jal create_and_draw
		j _row7_else

_row7_or4:
	bne s7, 9, _row7_or5
		jal create_and_draw
		j _row7_else

_row7_or5:
	bne s7, 11, _row7_else
		jal create_and_draw
		j _row7_else		

	# else
	
_row7_else:
	
	addi s5, s5, 5  # need to still inc to go to next x value
	inc s7
	j _row7_for_top

_leave_row7:
	leave
	
row8:
	# row 8
	enter
	
	li s5, 0 # reset x value
	li s6, 35  # change y value to 35
	
	li s7, 0  # i = 0
	# for(int i = 0; i <= walls_array.size; i++)
_row8_for_top:
	bgt s7, 11, _leave_row8

	#row 4
	# if(j == 0 || j == 4 || j == 9 || j == 11)
	bne s7, 0, _row8_or1
		jal create_and_draw
		j _row8_else

_row8_or1:
	bne s7, 4, _row8_or2
		jal create_and_draw
		j _row8_else
	
_row8_or2:
	bne s7, 9, _row8_or3
		jal create_and_draw
		j _row8_else
		
_row8_or3:
	bne s7, 11, _row8_else
		jal create_and_draw
		j _row8_else

	# else
	
_row8_else:
	
	addi s5, s5, 5  # need to still inc to go to next x value
	inc s7
	j _row8_for_top

_leave_row8:
	leave
	
	
row9:
	# row 9
	enter
	
	li s5, 0 # reset x value
	li s6, 40  # change y value to 30
	
	li s7, 0  # i = 0
	# for(int i = 0; i <= walls_array.size; i++)
_row9_for_top:
	bgt s7, 11, _leave_row9

	#row 4
	# if(j == 0 || j == 2 || j == 5 || j == 6 || j == 9 || j == 11)
	bne s7, 0, _row9_or2     # or1
		jal create_and_draw
		j _row9_else

_row9_or1:                    # cut this wall
	bne s7, 2, _row9_or2
		jal create_and_draw
		j _row9_else
	
_row9_or2:
	bne s7, 5, _row9_or3
		jal create_and_draw
		j _row9_else
		
_row9_or3:
	bne s7, 6, _row9_or4
		jal create_and_draw
		j _row9_else

_row9_or4:
	bne s7, 9, _row9_or5
		jal create_and_draw
		j _row9_else

_row9_or5:
	bne s7, 11, _row9_else
		jal create_and_draw
		j _row9_else		

	# else
	
_row9_else:
	
	addi s5, s5, 5  # need to still inc to go to next x value
	inc s7
	j _row9_for_top

_leave_row9:
	leave
	
row10:
	enter
	
	li s5, 0 # reset x value
	li s6, 45  # change y value to 5
	
	li s7, 0  # i = 0
	# for(int i = 0; i <= walls_array.size; i++)
_row10_for_top:
	bgt s7, 11, _leave_row10
	# if(j == 0 || j == 6 || j == 11)
		bne s7, 0, _or_row10
		# create wall and display wall
		jal create_and_draw	
		addi s5, s5, 5
		j _else_row10
		
_or_row10:
		bne s7, 10, _else_row10
		# create wall and display wall
		jal create_and_draw
		addi s5, s5, 5
		
_else_row10:
		# else
		addi s5, s5, 5
			# create empty space
			# draw empty space
	inc s7
	j _row10_for_top

_leave_row10:
	leave
	
row11:
	enter
	li s5, 0 # reset x value
	li s6, 50  # change y value to 5
	
	li s7, 0  # i = 0
	# for(int i = 0; i <= walls_array.size; i++)
_row11_for_top:
	bgt s7, 11, _leave_row11
	
	# row 11
	jal create_and_draw
	addi s5, s5, 5
	
	inc s7  #i ++
	j _row11_for_top

_leave_row11:
	leave
