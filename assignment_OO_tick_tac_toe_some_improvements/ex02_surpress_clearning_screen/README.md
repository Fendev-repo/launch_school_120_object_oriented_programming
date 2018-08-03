# Assignment: OO Tic Tac Toe

## Exercise description
The first time we display a board, we want to suppress the clearing of the screen. This is so we can see the welcome message, or the play again message. However, the method invocation, display_board(false) is incredibly vague. Six months from now, no one will remember what that false stands for without looking at the method implementation. Let's change the method so that we can invoke it like this: display_board(clear_screen: false).

### Problem decomposition
	- Sub-problems
		- where is the best place to define this method?
			Option 1: Instance method in TTTGame class
			Option 2: Instance method in Board class
			I think that its best placed in the TTTGame, as there
			are other similiar method display_result(). Depending
			on future requirements, it may be best placed to
			extract this and other similiar messages to a module.
### Examples
	clear() => # clears the terminal
### Data structures
### Algorithm
### Code
