########################################################
# Joshua Frank
# JOF91
########################################################

.include "constants.asm"
.include "macros.asm"


.global hit_cookie_check
.global enemy_hit

.data
	enemy_hit: .byte 0

.text

hit_cookie_check:
	enter
	
	move t6, a0   # x
	move t7, a1   # y
	
	################ cookie 1
	lb t0, cookie_1
	
	# if(x == 15 and y == 5 and cookie_1 is alive)
	bne t6, 15, _cookie_next
	bne t7, 5, _cookie_next
	bne t0, 1, _cookie_next
		la t0, cookie_1
		li t1, 0        # sets cookie to dead / 0
		sb t1, (t0)
		
		la t0, cookie_counter   # lower cookie counter
		lw t1, (t0)
		dec t1
		sw t1, (t0)
		
		# if(enemy hit == 0)    # checks if enemy is hitting cookie
		lb t0, enemy_hit
		bne t0, 0, _cookie_end
		
		la t0, points
		lw t2, points
		li t1, 1        # point value for this cookie
		add t1, t1, t2
		sb t1, (t0)
		j _cookie_end
		
	############### cookie 2
	
_cookie_next:
	lb t0, cookie_2
	# if(x == 15 and y == 5 and cookie_2 is alive)
	bne t6, 25, _cookie_next_3
	bne t7, 10, _cookie_next_3
	bne t0, 1, _cookie_next_3
		la t0, cookie_2
		li t1, 0        # sets cookie to dead / 0
		sb t1, (t0)
		
		la t0, cookie_counter   # lower cookie counter
		lw t1, (t0)
		dec t1
		sw t1, (t0)
		
		# if(enemy hit == 0)    # checks if enemy is hitting cookie
		lb t0, enemy_hit
		bne t0, 0, _cookie_end
		
		la t0, points
		lw t2, points
		li t1, 5        # point value for this cookie
		add t1, t1, t2
		sb t1, (t0)
		j _cookie_end
		
_cookie_next_3:
	lb t0, cookie_3
	# if(x == 40 and y == 30 and cookie_3 is alive)
	bne t6, 40, _cookie_next_4
	bne t7, 30, _cookie_next_4
	bne t0, 1, _cookie_next_4
		la t0, cookie_3
		li t1, 0        # sets cookie to dead / 0
		sb t1, (t0)
		
		la t0, cookie_counter   # lower cookie counter
		lw t1, (t0)
		dec t1
		sw t1, (t0)
		
		# if(enemy hit == 0)    # checks if enemy is hitting cookie
		lb t0, enemy_hit
		bne t0, 0, _cookie_end
		
		la t0, points
		lw t2, points
		li t1, 1       # point value for this cookie
		add t1, t1, t2
		sb t1, (t0)
		j _cookie_end
		
_cookie_next_4:
	lb t0, cookie_4
	# if(x == 10 and y == 25 and cookie_4 is alive)
	bne t6, 10, _cookie_next_5
	bne t7, 25, _cookie_next_5
	bne t0, 1, _cookie_next_5
		la t0, cookie_4
		li t1, 0        # sets cookie to dead / 0
		sb t1, (t0)
		
		la t0, cookie_counter   # lower cookie counter
		lw t1, (t0)
		dec t1
		sw t1, (t0)
		
		# if(enemy hit == 0)    # checks if enemy is hitting cookie
		lb t0, enemy_hit
		bne t0, 0, _cookie_end
		
		la t0, points
		lw t2, points
		li t1, 3       # point value for this cookie
		add t1, t1, t2
		sb t1, (t0)
		j _cookie_end
		
_cookie_next_5:
	lb t0, cookie_5
	# if(x == 15 and y == 35 and cookie_5 is alive)
	bne t6, 15, _cookie_next_6
	bne t7, 35, _cookie_next_6
	bne t0, 1, _cookie_next_6
		la t0, cookie_5
		li t1, 0        # sets cookie to dead / 0
		sb t1, (t0)
		
		la t0, cookie_counter   # lower cookie counter
		lw t1, (t0)
		dec t1
		sw t1, (t0)
		
		# if(enemy hit == 0)    # checks if enemy is hitting cookie
		lb t0, enemy_hit
		bne t0, 0, _cookie_end
		
		la t0, points
		lw t2, points
		li t1, 10       # point value for this cookie
		add t1, t1, t2
		sb t1, (t0)
		j _cookie_end
		
_cookie_next_6:
	lb t0, cookie_6
	# if(x == 15 and y == 35 and cookie_5 is alive)
	bne t6, 50, _cookie_end
	bne t7, 5, _cookie_end
	bne t0, 1, _cookie_end
		la t0, cookie_6
		li t1, 0        # sets cookie to dead / 0
		sb t1, (t0)
		
		la t0, cookie_counter   # lower cookie counter
		lw t1, (t0)
		dec t1
		sw t1, (t0)
		
		# if(enemy hit == 0)    # checks if enemy is hitting cookie
		lb t0, enemy_hit
		bne t0, 0, _cookie_end
		
		la t0, points
		lw t2, points
		li t1, 20       # point value for this cookie
		add t1, t1, t2
		sb t1, (t0)
		j _cookie_end

_cookie_end:

	leave
