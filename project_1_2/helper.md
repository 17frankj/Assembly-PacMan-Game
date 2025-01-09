# Extra information about the provided code

First and foremost, lets thank Jarrett Billingsley for implementing most of the functions in this file (and thus writing most of this page :).

Here you'll find some documentation for the code of Part A, it is a lot of code! So make sure you know what you have available. I promise it will make things a lot easier.

## Warning about multiple files!

The example contains multiple files! This is great because it helps you organize your code in a more efficient manner. Yet, with great power... 

The catch is that you have to take care of how you use those files.

There are two types of file:
 - Files without code: They contain only directives (.eqv, .macro)!
 - Files WITH code OR variables!

For files withOUT code, you must include them like so:
```
.include filename.asm
```

Check the example with `convenience.asm`!

Files with code or data MUST NEVER be included!

## `main.asm`

This is what will become your program.

## `macros.asm`

This will save you a lot, lots, lotssss! of time. It contains:

- Constant definitions for syscalls
	<br>  Don't forget these are not variables! They are just a fancy-copy-paste tool.
- Some macros for calling some of the common syscalls, e.g. `syscall_print_int`
	<br> **Mind the registers that are modified by each of them!**
	<br> Macros are NOT functions, don't try to used them as such! I promise it'll make your lives miserable.
- `inc` and `dec` macros for the very common "add 1" or "subtract 1" operations, e.g. `inc t0`
- **The big one: `enter` and `leave` macros to simplify writing functions**
<br> We are all sick of `push ra` `pop ra` `jr ra`.
However, now that you understand *why* we push and pop those registers, they are abstracted behind some macros which do all the pushes and pops at once.
<br>
When you write a function, you can do this instead:
<br>
```ruby
my_function:
	enter

	# put code here

	leave
```
<br>
The macro `enter` saves `ra` to the stack. `leave` restores `ra` from the stack and calls `jr ra`.
<br>
If you need to save the `s` registers, just list them after the `enter` and `leave` in the same order:
<br>
```ruby
my_function:
	# saves ra, s0, and s1
	enter s0, s1

	# put code that uses s0 and s1 here

	# same order as enter
	leave s0, s1
```
<br>
The function `wait_for_next_frame` in `main.asm` contains an example of that.


## `display.asm`

This is what lets you draw things to the display (and get the keys that the user is pressing). There are many functions in here.

### About the display

The display simulator is mapped in memory. This means that there is an area in memory that you can write to when you want to display something. All this code has been implemented for you.
But here is how this works.

```ruby
.eqv DISPLAY_CTRL       0xFFFF0000
.eqv DISPLAY_KEYS       0xFFFF0004
.eqv DISPLAY_BASE       0xFFFF0008
.eqv DISPLAY_END        0xFFFF1008
.eqv DISPLAY_SIZE           0x1000
```

The LEDs in the display are mapped in memory as an array of bytes organized in row-major order, i.e., the 2-dimensional array is mapped to a 1-dimensional array row-by-row. Like the matrix of Lab 4. The array starts at address `DISPLAY_BASE` and each byte represents an LED. By writing/reading the correct positions of that array, we can turn on/off or check the status of each LED in the display.
You can use the `display_set_pixel(int x, int y, int color)` function (see below) to set the LED in coordinates (x, y) to the given color. Use the `int display_get_pixel(int x, int y)` to get the color of the LED in coordinates (x, y).

Writing into memory, is not enough to display the picture. To do that you need to trigger the refresh of the display by writing to memory position `DISPLAY_CTRL`. If you write 0 in this memory address, the memory array is copied to the actual display; if you write something other than zero, the memory array is copied to the display and then the memory is cleared. Check `void display_update()` and `void display_update_and_clear()` below.

The status of the keyboard keys are also available in a memory address: `DISPLAY_KEYS`. You can read a bitfield with the status of the keyboard from this memory address.

These are the available colors:

```ruby
.eqv COLOR_BLACK       0
.eqv COLOR_RED         1
.eqv COLOR_ORANGE      2
.eqv COLOR_YELLOW      3
.eqv COLOR_GREEN       4
.eqv COLOR_BLUE        5
.eqv COLOR_MAGENTA     6
.eqv COLOR_WHITE       7
.eqv COLOR_DARK_GREY   8
.eqv COLOR_DARK_GRAY   8
.eqv COLOR_BRICK       9
.eqv COLOR_BROWN       10
.eqv COLOR_TAN         11
.eqv COLOR_DARK_GREEN  12
.eqv COLOR_DARK_BLUE   13
.eqv COLOR_PURPLE      14
.eqv COLOR_LIGHT_GREY  15
```

**Note**: As common in many graphical interfaces, (0, 0) is located in the top-left corner.

### Function documentation

Read the file named `display_2227_0611.asm` to find documentation on each available function.