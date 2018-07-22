# Assignment: OO Rock Paper Scissors

## Bonus Features
### Adjust computer choice based on history

### Exercise description
Come up with some rules based on the history of moves in order for the computer to make a future move. For example, if the human tends to win over 60% of his hands when the computer chooses "rock", then decrease the likelihood of choosing "rock". You'll have to first come up with a rule (like the one in the previous sentence), then implement some analysis on history to see if the history matches that rule, then adjust the weight of each choice, and finally have the computer consider the weight of each choice when making the move. Right now, the computer has a 33% chance to make any of the 3 moves.


### PEAOS
	- Problem
		- sub-problems
			- How do I programmatically identify the 'winning rate' of each move option
				for both player and computer - after each round has been concluded
					- each of players winning moves will need to be given a success rate
					- success rate = number of wins per move - based on the rounds played
						at that time
					- players_winning_move_success_rates[ spock: 2, paper: 0]
					
					Example 4 round game A: ** Current move_history solution
					@move_history = { player: ['tie', 'paper', 'spock', 'paper'], 
					 computer: ['tie', 'lizard','lizard','rock' ] }


					Example 4 round game B: ** Potential new win_history solution
					@player_success_rates  = { paper: 0, rock: 0, scissors: 0,
                               lizard: 0, spock: 0 }

			
			- What is the best way for the computer to select a move that is most 
			  likely based on game history to win
				- the computer will select the best option to neutralise the players 
					most 	
					successful moves - in order
					example: 
					players_winning_move_success_rates[ spock: 2, paper: 0]
					players_winning_move_success_rate.max_by{ |k, v| v }[0] => 'spock'
			
			- How would the computer neutralise a statistically probable future 
				attack - and at 	the same time increase the probability of winning
				- Once the computer has the name of the players most successful 
					choice, then the 
					computer will randomly choose from the two options that best 
					neutralizes the players most successful attack
					- example: 
					round 4 of 10.
					Player has won using :spock 2 times - which is the most 
					wins for any one option for the player.
					- the computer then ramdomly selects from the two options 
						that best neutralise and win over that attack.  
						['scissors', 'rock'].sample
					- the process then repeats 
						- and the players_winning_move_success_rate	is updated
						- or if unchanged - then the same defence/attack profile 
							is used.
						- and if changed - then the new 
							players_winning_move_success_rate number one 
							is selected for neutralisation

			- Do I need a custom object to enable a solution
				No, I think a Hash initialized in the scorecard as a collaborator 
				object will be fine.
				- I think 'a scorecard has_a player_move_success_rate' seems 
					reasonable				

		- Reasonable messages for an object to receive
			- what is the players most successful move so far
				- players_most_successful_move_so_far()
			- what is the best move for then computer to neutralise the 
				players	best move
					- counter_attack()

	- Extract nouns and verbs
		- nouns
			- rules
		- verbs
			- chooses
			- weigh
			- neutralize



			
	- Associations with Collaborators

	- *** CURRENT CLASSES ***

		- Computer class: < Human
			- Single Responsibility
				- To represent the computer 'AI opposition' object in our game.
			- Public Interface
				- set_name()
				- choose() # Change this to this: counter_attack() 		
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
				- Hash stored as @value instance variable
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
















