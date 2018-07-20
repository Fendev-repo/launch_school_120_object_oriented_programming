# Assignment: OO Rock Paper Scissors

## Bonus Features
### Exercise: Add Lizard and Spock

### Exercise description
This is a variation on the normal Rock Paper Scissors game by adding two more options - Lizard and Spock. The full explanation and rules are
New game rules

> New game rules

* Scissors cuts Paper
*	Paper covers Rock
* Rock Crushes Lizard
* Lizard poisons Spock
* Spock smashes Scissors
* Scissors decapitates Lizard
* Lizard eats Paper
* Paper disproves Spock
* Spock vaporizers Rock
* Rock crushes Scissors



### PEAOS
	- Problem
		- sub-problems
			- what is the best way to manage this new game complexity; i.e., additional game rules
				- creation of a new class object called RuleBook
				- an instance of RuleBook will hold all the game rules
				- a single method that compares move_a against move_b and returns a boolean
			- would it be more effective to introduce a new class - or use the existing classes
				- yes, introducing a RuleBook class looks like the best option.
			- how would I store the rules for effective storage and access
				- Method call # who_has_best_move(player, computer) # => :player / :computer
					
					winning_moves = { 
						scissors: ['paper', 'lizard'],
						paper: 		['rock', 'spock'],
						rock: 		['lizard', scissors],
						lizard: 	['spock', 'paper'],
						spock: 		['scissors', 'rock']}
						
					players_winning_options = winning_moves[player.move]
					players_winning_options.include?(computer.move) ? :player : :computer # => true / false


			- Where should the new object be instantiated
				- OPTION A: a game has_a set of rules; therefore the RuleBook class could be a collaborator object within RPSGame class
				- OPTION B: a move must also adhere to a set of rules; therefore the RuleBook class could also be a collaborator object within Move class.  
				- After consideration - I think a game has_a rulebook.
					- therefore the RuleBook class will be instantiated as a collaborator object within the RPSGame class
		
		- Reasonable messages for an object to receive
			- does this move beat this move
				- move_a.beats?(move_b)
				- who_has_best_move?(player, computer)

	- Extract nouns and verbs
		- nouns
			- rules
		- verbs
			- beats?
			- better?
			
	- Associations with Collaborators

	- *** CURRENT CLASSES ***

		- Computer class: 
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
				- none currently.

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
				- TO BE ADDED - RuleBook class

		- Player class:
			- Single Responsibility
				- To represent the 'Abstract Class' for Humans and Computers to inherit from
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

	- ** END CURRENT CLASSES ***
	- ** NEW SOLUTION CLASS(ES) ***

		- RuleBook class:
			- Single Responsibility
				- To represent the rules of the game
			- Public Interface
				- who_has_best_move(player, computer)
			- Collaborator Objects
				- none currently	

	- ** END SOLUTION CLASS(ES) ***

	- Orchestrate
		Association
		- an RPSGame has_a Scorecard
			- Therefore a Scorecard will be instantiated as an collaborator object in the RPSGame class

		Orchestration Algorithm
			- RPSGame object is instantiated
				- Human class is instantiated
				- Computer class is instantiated
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
				- who_won? # This needs to be modified to incorporate the new Rulebook class
					- RuleBook#who_has_best_move(player, computer)  # This needs to be added

      - next unless scorecard.winning_score_reached?
      - congratulate_winner
      - break unless play_again?
   		- display_goodbye_message
	
	- Spike
















