# Assignment: OO Tic Tac Toe

## Exercise description
We use system "clear" to clear the screen. Suppose we want to change this to some other command in the future - we'd have to change it in multiple places. Create a clear method and call this new method instead of system "clear".

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
