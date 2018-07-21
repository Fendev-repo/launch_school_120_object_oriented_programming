# Assignment: OO Rock Paper Scissors

## Bonus Features
### Exercise: Add a class for each move

### Exercise description
What would happen if we went even further and introduced 5 more classes, one for each move: Rock, Paper, Scissors, Lizard, and Spock. How would the code change? Can you make it work? After you're done, can you talk about whether this was a good design decision? What are the pros/cons?


### PEAOS
	- Problem
		- sub-problems

			- where is the best place to place these collaborator objects?
				- a Move has_a value # This currently exists as a instance varible.
				- a Player has_a chosen_move
					- After consideration; I think that even though it 'reads' better to
						have a 'Player has_a chosen_move', that would mean that much of the
						existing code would need to be changed; as well as moving selection
						complexity to both the Human and Computer classes.  Therefore, I 
						chosen go with a 'Move has_a chosen value' and value is a new class
						object.

			- what behavior should each new Value object (i.e., paper, rock etc) have?
				- should simple confirm its value
					- name()

			- should the Move class be the superclass for each of the moves types?
				- No, as I have decided that the Move class will have a 
					collaborator object - I will utilize the existing instance
					variable 'value' - and store a collaborator object called value
								
			- Should there be any changes to the existing Move class?
				- I think everything that currently exists is fine to stay
					- I will need to modify the value instance variable
						and modify the existing instance methods methods to
						enable the validation of the new Value objects. 
						i.e.	def lizard?(value)
										value.name == 'lizard'
									end
				- I will also need to add the ability to instantiate the correct
					value based on the selected move.  i.e Paper class - or Spock etc.

			- is this a good decision - based on the existing code currently?
				No. I don't think the added complexity offers enough benefits.

			- what are the pros?
				- encapsulation and granular control of specific move classes
			- what are the cons?
				- unneccessary complexity

		- Reasonable messages for an object to receive
			- what is the value?
				- name() => 'Spock'

	- Extract nouns and verbs
		- nouns
			- move
		- verbs
			- compare
			
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
				- none currently		  			

		- RuleBook class:
			- Single Responsibility
				- To represent the rules of the game
			- Public Interface
				- who_has_best_move(player, computer)
			- Collaborator Objects
				- none currently	

	- ** END CURRENT CLASSES ***

	- ** NEW SOLUTION CLASS(ES) ***
		- Paper class:
			- Single Responsibility
				- To represent the Paper object (used as a value in Move)
			- Public Interface
				- value? => 'spock'
			- Collaborator Objects
				- none currently

		******** repetitive code ******* 
			Note: same above class info for Rock, Scissors, Lizard and Spock classes.


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
















