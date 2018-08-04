# Assignment: OO Tic Tac Toe

## Exercise description
As we glance down the list of methods, it's surprising that we display the board in the TTTGame class. That seems like a responsibility of the Board class. We should be able to tell the board to "display yourself". Let's move the logic from display_board to Board#draw. We'll still keep the TTTGame#display_board method, though, because the TTTGame needs to tweak the output a little (eg, the marker prompt at the top, and the padding.)


### Problem decomposition - PEDAC (Method level problem solving)
	-	Description
		- Simple refactor to simplify the render_board() by using the 
			instance variable @squares directly within the class.
	- Sub-problems
### Examples
### Data structures
### Algorithm
### Code	




