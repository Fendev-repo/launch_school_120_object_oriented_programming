# Assignment: OO Tic Tac Toe

## Exercise description
The first time we display a board, we want to suppress the clearing of the screen. This is so we can see the welcome message, or the play again message. However, the method invocation, display_board(false) is incredibly vague. Six months from now, no one will remember what that false stands for without looking at the method implementation. Let's change the method so that we can invoke it like this: display_board(clear_screen: false).

### Problem decomposition - PEDAC (Method level problem solving)
	- Description
		- This exercise is a refactoring exercise.  We simply want
			to improve the readability and maintainability of the code 
			but keep the same game functionality.

	- Sub-problems
		- How do I implement this type of argument to this method
			- The method example display_board(clear_screen: false)
				indicates that this method takes a hash as an 
				argument.
				Therefore the implementation will look like this:
				def display_board(hsh = {})
		- What is the best name for this {} parameter
			- screen seems like a good choice, it will read like this


### Examples
	- Implementation:
		def display_board(screen={})
			clear_cli if screen[:clear_screen] => true
			clear_cli if screen[:clear_screen] => false
		end

	- Invocation:
		display_board(clear_screen: false) # Don't clear the cli
		display_board(clear_screen: true) # Do clear the cli

### Data structures
### Algorithm
### Code
