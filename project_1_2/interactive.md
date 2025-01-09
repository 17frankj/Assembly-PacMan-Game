## How does an interactive program work?

Programming an interactive game might look more complicated than it actually is!
Games - **and any other interactive program** - follow this very common pattern. For example a game with a player and some enemies:

* While the game is still running...
	- Check for user **input.**
  	- (I've given you this.)
		- ...and change the variables, e.g. change the player's X position.
	- **Update** all the parts of the game that change.
		- Move the enemies.
		- Check if the player hit an enemy, and respond.
	- **Display** everything onscreen.
		- Draw the player.
		- Draw the enemies.
		- Draw the score and lives remaining.
		- Tell the screen to update.
	- **Wait** for the next frame.
		- (I've given you this.)

# Never, ever, ever write a program all at once and then see if it works.

I cannot stress this enough: **DON'T DO IT!**

**Don't try to do everything at once.** Break it up into small pieces, and write and test **one. piece. at. a. time. please.**

Each of the above bullet points could become a `jal`, like `jal check_input`, `jal move_enemies` etc. Then each of those functions could be more `jal`s to simpler functions, until eventually all your functions are like 20-30 lines apiece. It's so much nicer than trying to jam everything into one function. **... and easier to debug too!**

# If you get stuck on one step, don't struggle on it for hours/days, and don't skip to the next step.

The first is a waste of your time. The second will leave you with a buggy, half-implemented spaghetti mess that you will never be able to complete.

![Spaghetti Code](https://i.pcmag.com/imagery/encyclopedia-terms/spaghetti-code-spageti.fit_lim.size_1024x.gif)<br>https://www.pcmag.com/encyclopedia/term/spaghetti-code

If you're really stuck on something, ask for help. Please. (office hours, Ed, email)

## What is a "frame"?

A "frame" is **one step of the program/game.** Interactive programs do not run all the way from beginning to end all at once. Instead, they run on a sort of discrete timeline. The timeline is measured in **frames.** Like a movie.

![](images/frame.png)

> This applies to *any* interactive program, such as graphical user interfaces, programs that run on embedded CPUs in appliances, etc.

Every single frame, you do *one step* of the game. If the player is moving left, you don't go into a loop and move them left until they hit the left side of the screen. Instead, you move them left by *one unit per frame.* Then you move the enemies one unit. Then you move the bullets one unit. Then you wait, and do it all over again. It's like people taking turns in a board game.

This game will run at about **60 frames per second.** I have given you a function to call **once per main loop** that will maintain the framerate at 60FPS. This function also maintains a "frame counter" variable which counts the number of frames since the game started. This will be useful for a number of features. E.g. maybe you don't want to update the position of your player/the enemy in all frames.

## Model, View, Controller

**Model, View, Controller** (or **MVC**) is a common engineering technique. It's a way of splitting up your program into more manageable pieces.

The core idea is: what your program *does* should be separated from *how it looks* and *how you interact with it.*

The three parts interact like this:

The *model* is all of your program's "state": its variables, arrays, etc.

The *view* is what the user sees.

The *controller* is how the model is manipulated. Typically the user is doing this, but your code does it too.

> **The view *is not the same thing as the model.*** It's very easy to mix them up! The view is generated from the model, but the model could stay the same and use several different views. Think about it like your smart watch face. The time is always the same (hours, minutes, seconds), but the way it's displayed can easily be changed.

### Why do this?

It makes your code **so much cleaner and simpler to --> write, understand, fix, and change <--.**

For example, let's consider the task of "moving a player to the left." There are three parts here:

- **Model:** A variable to hold the player's X (horizontal) position
- **View:** A function to draw the player on the screen
- **Controller:**
	- A function to check if the user is pressing left, that calls...
	- ... a function to decrease the player's X position, keeping it in a valid range

So:
1. You know how to make a variable in MIPS.
2. You know how to make a function that checks if the user is pressing left. (check `keyboard_controller.asm`)
3. You know how to change the value of a variable in memory.
4. You know how to call a function to draw an image on the screen at certain coordinates. (check `display_2211_0822.asm`)

So you can do this! :) \m/


### That's why

Once you split things up like this, it saves you a lot of work. **The function that draws the player never really has to change.** Even though the player can move around all over the place, all that function has to know is its position, and it'll plop an image on the screen.

If you have a bug in the way your player moves, *you know exactly where to look.* It's gotta be in the function that changes the player's position.

And if you want to have some other way to control the player, such as for a cutscene or demo, you can do it by just calling the "move player" functions.
