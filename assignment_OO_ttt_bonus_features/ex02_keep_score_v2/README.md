# Assignment: TTT Bonus Features

## Exercise description
### Keep score
Keep score of how many times the player and computer each win. Don't use global or constant variables. Make it so that the first player to 5 wins the game.

### Problem decomposition
	- Description
		- The game currently has no way of keeping score of round wins.
			The exercise requires that a score is keep of the number
			of round wins; the winner of the game is the first player
			to reach 5 round wins.

	- Sub-problems
		- Is a custom object required to complete this exercise?
			- No, I don't think that is required - there is no reason
				at this stage for the added complexity. 
		- What existing class of object is best suited to keep score?
			I think that the existing board class is a reasonable place 
			to keep a score object
			- I think a Hash will be fine - i.e
				score:  { player: 0, computer: 1 } as a collaborator
				object saved to an instance variable witin the Board
				class.		  
		- Where is the best place to instantiated this score_board: 
			Hash object?
			- I will instantiate the round_score_board: in the Board 
			class initialize method.
		- How will I update the score?
			- When someone_won? is true, I will update the :score
				update_score(winning_marker)
		- How will differentiate between round wins and game wins?
			- For clarity, I will rename someone_won? to someone_won_round?
				then add game_won?
				The game_won? will be true when either player of computer
				reaches 5 wins.

### Examples
	score: { player: 0, computer: 0 }			