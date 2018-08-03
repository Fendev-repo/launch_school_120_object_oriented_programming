# Assignment: OO Tic Tac Toe

## Exercise description
Though an improvement, the necessity to even pass in a qualifier to the display_board method points to a deeper problem. The method doesn't take a large number of options; it just takes 1 option. That option serves as a fork in the method: one fork clears the screen, then displays the board, while the other fork just displays the board. Let's create two methods: display_board and clear_screen_and_display_board. The former only displays the board, while the latter clears the screen first.

### Problem decomposition - PEDAC (Method level problem solving)
	- Description
		- This exercise is another refactor to improve the maintainability,
			the actual behavior of the program is not to be changed.
	- Sub-problems
		- Where is the best place to put the clear_screen_and_display_board()
			- I will place this method in the interactable_module
		- What is the best way to DRY out the code if both of these methods
			display the board - which is a lot of repetitive code
			- I will create a new method render_board()
				The render_board() method simply renders the lines numbers etc
				This means there is only one implementation of this behaviour	

### Examples
	- Implementation:
		def display_board()
			# render_board
		end
		def clear_screen_and_display_board()
			# clear cli
			# render_board
		end

		def render_board()
			# render the lines and numbers 
		end

	- Invocation:
		display_board() # Only displays board
		clear_screen_and_display_board() # displays board and clears CLI
		render_board() # renders the lines and numbers

### Data structures
### Algorithm
### Code
