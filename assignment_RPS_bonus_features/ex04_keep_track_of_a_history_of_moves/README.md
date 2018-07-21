# Assignment: OO Rock Paper Scissors

## Bonus Features
### Exercise: Keep track of a history of moves

### Exercise description
As long as the user doesn't quit, keep track of a history of moves by both the human and computer. What data structure will you reach for? Will you use a new class, or an existing class? What will the display output look like?


### PEAOS
	- Problem
		- sub-problems
			- what is the best way to keep a history of moves
				- Use a Hash to store the moves
					- move_history = { plater: [], computer: [] }

			- what is the best way to store and access historic moves
				- using the hash[key] = []
				- using the hash[key] << move 
 	
			- should I create a new object class for this requirement
				- no, I think a move_history object is a simple requirement
					that does not need a custom class object.  Hash and Array, with
					Integers should be ok.

 			- where is the best place to integrate this object
 				- I think that a 'ScoreCard has_a move_history' seems reasonable.
 					- Therefore, when the ScoreCard is instantiated
 						- I will assign an instance method witin the initialize
 							method - instantiating a Hash that I can save to 
 							the local instance method @move_history, which can
 							store the history

		- Reasonable messages for an object to receive
			- what is the history of moves in order for both players
				- Give me the history of moves for both players.
					- move_history(default='all')
						=> 	{ player: ['spock', 'paper', 'spock'],
								computer: ['spock', 'paper', lizard]}
				- Give me either player or computer moves				
					- move_history('player')
						=> ['spock', 'paper', 'spock']
				- Give me both player and computer moves - zipped to each round and 
					in order.		
					- move_history('zipped_per_round_with_player_first_indx')
						=> 	[['spock', 'spock'], ['paper', 'paper'], ['spock', 'lizard']]

	- Extract nouns and verbs
		- nouns
			- history
		- verbs
			- get
			- show
			
	- Associations with Collaborators

	- *** CURRENT CLASSES ***

		- Computer class: < Human
			- Single Responsibilty
				- To represent the computer 'AI oposition' object in our game.
			- Public Interface
				- set_name()
				- choose()		
			- Collaborator Objects
				- Move class

		- Human class:
			- Single Responsibility
				- To represent the human player in our game.
			- Public Interface
				- set_name()
				- choose()
			- Collaborator Objects
				- Move class

		- Move class:
			- Single Responsibility
				- To represent a 'move' which a player of the game can take.
			- Public Interface
				- scissors?()
				- rock?()
				- paper?()
				- >()
				- <()
				- to_s()
			- Collaborator Objects
				- TO BE ADDED stored as @value instance variable
											- Paper
											- Rock 
											- Scissors
											- Lizard
											- Spock 

		- RPSGame class:
			- Single Responsibility
				- To orchestrate the program classes to enable game play.
			- Public Interface
				- display_welcome_message()
				- display_goodbye_message()
				- display_moves()
				- display_winner
				- who_won()
				- play_again?()
				- play()
			- Collaborator Objects
				- Human class
				- Computer Class
				- Scorecard
				- RuleBook class

		- Player class: < Human
			- Single Responsibility
				- To represent the 'Abstract Class' for Humans 
					and Computers to inherit from
			- Public Interface
				- none currently
			- Collaborator Objects
				- none currently

		- Scorecard class:
			- Single Responsibility
				- To represent the scorecard of round wins for each game played
			- Public Interface
				- score()
				- to_s()
				- winning_score_reached()
			- Collaborator Objects
				- Std Ruby Core Objects:  Hash{Array[Strings]}
					- @move_history # Instance variable

		- RuleBook class:
			- Single Responsibility
				- To represent the rules of the game
			- Public Interface
				- who_has_best_move(player, computer)
			- Collaborator Objects
				- none currently	

		- Paper class:
			- Single Responsibility
				- To represent the Paper object (used as a value in Move)
			- Public Interface
				- value? => 'spock'
			- Collaborator Objects
				- none currently

		******** repetitive code ******* 
			Note: same above class info for Rock, Scissors, Lizard and Spock classes.
	
	- ** END CURRENT CLASSES ***

	- ** NEW SOLUTION CLASS(ES) ***


	- ** END SOLUTION CLASS(ES) ***

	- Orchestrate
		Association
		- an RPSGame has_a Scorecard
			- Therefore a Scorecard will be instantiated as an collaborator 
				object in the RPSGame class

		Orchestration Algorithm
			- RPSGame object is instantiated
				- Human class is instantiated
					- Move class is instantiated
						- a specific value is instantiated - Spock - Paper etc
				- Computer class is instantiated
					- Move class is instantiated	
						- a specific value is instantiated - Spock - Paper etc
				- Scorecard class is instantiated
						- A Hash is instantiated
							- and assigned to instance variable @move_history
				- Rulebook class is instantiated

			- display_welcome_message()

			- play_round
				- display_scorecard
    		- human.choose
    		- computer.choose
    		- display_moves
    		- update_scorecard
    		-display_round_winner
			
			- display_scorecard()
			- human.choose()
			- computer.choose()
			- display_moves()
			- update_scorecard
				- who_won? # This needs to be modified to incorporate the 
					new Rulebook class
					- RuleBook#who_has_best_move(player, computer)  

      - next unless scorecard.winning_score_reached?
      - congratulate_winner
      - break unless play_again?
   		- display_goodbye_message
	
	- Spike
















