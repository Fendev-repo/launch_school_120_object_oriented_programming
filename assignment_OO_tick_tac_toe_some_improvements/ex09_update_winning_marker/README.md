# Assignment: OO Tic Tac Toe

## Exercise description
The next improvement we'll make is related to our most complicated method: Board#winning_marker. The problem with this method is that it relies on knowledge of both the human and computer markers. This doesn't feel quite right. Why does the Board class have to know about specific markers in the TTTGame class? A board object contains the state of the board. It's responsible for knowing things related to a board: whether all squares are marked, how to draw itself, how many empty squares are left, and whether a marker has won. The goal of Board#winning_marker is to return some winning marker or nil, but in our implementation, we hardcoded the human and computer markers. This board's implementation is tied to the implementation of TTTGame class. But in this case, that's not necessary. We should change the implementation of Board#winning_marker to see if any marker, not just the human or computer's, has won. If so, return that marker, and if not, return nil.


### Problem decomposition - PEDAC (Method level problem solving)
	-	Description
		- Another refactoring exercise.  For this one, we need to reduce coupling.
			Currently the Board class is unnecessarily knows too much about TTTGame 
			class.  As the exercise suggests - refactoring the Board#winning_marker 
			is require.

	- Sub-problems
		- What is the best way to identify what marker has won?
			- Forget passing a suggested winner as it currently reads
				lets simply count the @squares for a winning pattern.
		- What is the best way to identify a winning pattern?
			- interate over WINNING_LINES
					- iterate map() over winning pattern [1, 2, 3]
						- @squares[1]
						- @squares[2]
						- @squares[3]
			- Then using the returned array from map - we can check that
				all of the elements are the same.
				- if all elements need to be the same - the we can take the
					first element and then use the Array#all?('X') => true / false		
				- if any of the patterns returns true - then you have found
					the winnier.  Simply return any of the elements from the 
					winning pattern array
					
				WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]] 

### Examples
	- example A: @squares = { 1 => Square.marker = 'X', 2 => Square.marker = 'X', 3 => Square.marker = 'X' }
	- Board#winning_marker() => 'X'

### Data structures
### Algorithm
### Code
