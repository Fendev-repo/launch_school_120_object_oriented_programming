# Assignment: TTT Bonus Features

## Exercise description
Keep score of how many times the player and computer each win. Don't use global or constant variables. Make it so that the first player to 5 wins the game.

### Problem decomposition
	- Description
		- The game now requires that a score of round wins is maintained.
			When the score reaches 5 wins for either player, the game is over
			and the first player whom reaches 5 wins is the game winnier.
	- Sub-problems
		- What object should keep the score?
			- I think its reasonable for a Board to keep the score

		- How will the score be persisted during the game?
			- I think a Hash object will be fine.
				score: {human: 0, computer: 2 }

		- What is a good way of presenting the score during each game?
			"Current score: ""
			"Human: #{board.human_wins} wins" 
			"Computer: is on #{board.computer_wins} wins"

		- How will we know when the winning game score is reached?
			- Based on the board maintaining the score Hsh, then 
				a method that checks if either player or computer
				have reached >= 5 wins.
				board.winning_score_reached?
					=> true
					=> false
				score.values.any? {|v| v >= 5}

		- How will I update the score when a round is won?
			- Based on the score being kept in the Board class
				I think a simple method like 
					board.add_to_score(:player)	
					board.add_to_score(:computer)	

		- Do I need a custom object for keeping the score?
			- no, a Hash will be fine.