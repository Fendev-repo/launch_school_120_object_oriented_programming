# Assignment: OO Tic Tac Toe

## Exercise description
As we glance down the list of methods, it's surprising that we display the board in the TTTGame class. That seems like a responsibility of the Board class. We should be able to tell the board to "display yourself". Let's move the logic from display_board to Board#draw. We'll still keep the TTTGame#display_board method, though, because the TTTGame needs to tweak the output a little (eg, the marker prompt at the top, and the padding.)


### Problem decomposition - PECOS (Object level problem solving)
	-	Description
		- Simple refactor - Extract the 'display' behavior from interactable module to the 
			Board class.

	- Sub-problems
		- Based on my code already having had extracted all of the
			cli interacting behaviour into the interactable_module - what is
			the best way to implement this new requirement?
			- I will simply move the following methods
				display_board()
				render_board()
				both from interactable_module to the Board class
			- Then, pass the required objects as arguments to the
				board class - to enable the markers and board to render correctly	
			 

### Extract nouns and verbs
### Collaborator associations
	- Class Board
		- Single responsibility:
			Responsible for representing the board for each TTT game
		- Public interface
			- get_square_at()
			- set_square_at()
			- unmarked_keys()
			- full?()
			- someone_won?()
			- count_human_marker(squares)
			- count_computer_marker(squares)
			- winning_marker()
			- reset()
			- WILL ADD => render_board()
			- WILL ADD => display_board()
		- Collaborator associations:
			- none currently

	- Module Interactable
		- Single responsibility:
		Responsible for keeping all the methods that interact with the terminal
		- Methods
			- print_lets_play_again()
			- display_welcome_message()
			- display_goodbye_message()
			- WILL MOVE => render_board()
			- clear_screen_and_display_board()
			- WILL MOVE => display_board()
			- human_moves()
			- display_result()
			- clear_cli()
			- play_again?()
		- Collaborator associations:
			- N/A - Module

### Orchestration engine
### Spike






