# Assignment: OO Tic Tac Toe

## Exercise description
Though we no longer need the Board#get_square_at method, we still need the Board#set_square_at method. This is the method that gets invoked when either the human or the computer makes their move. The method, though, is a little clunky. Let's make it more idiomatic Ruby. Instead of calling this: board.set_square_at(square, human.marker), let's update the board like this: board[square] = human.marker. That reads a lot better.


### Problem decomposition - PEDAC (Method level problem solving)
	-	Description
		- This is another simple refactor - to make the 
			human_moves() and computer_moves() methods read
			better.  I simply added a attr_accessor method for 
			the squares instance variable - which then allows
			the following invocation:
			board[square] = human.marker
		- I also overrode the Board#[]= method to make the
			assignment of Board.squares easier and cleaner. 	 

	- Sub-problems
### Examples
### Data structures
### Algorithm
### Code	




