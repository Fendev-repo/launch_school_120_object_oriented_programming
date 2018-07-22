# Assignment: OO Rock Paper Scissors

## Bonus Features
### Computer personalities

### Exercise description
We have a list of robot names for our Computer class, but other than the name, there's really nothing different about each of them. It'd be interesting to explore how to build different personalities for each robot. For example, R2D2 can always choose "rock". Or, "Hal" can have a very high tendency to choose "scissors", and rarely "rock", but never "paper". You can come up with the rules or personalities for each robot. How would you approach a feature like this?

### PEAOS
	- Problem
		- sub-problems
			- What is a good way to introduce personalities for
				the computer name options
				OPTION A: 'selection bias'
				- The 'personality' selection bias option is not 
					really appropriate, as the existing system is 
					effective for choosing moves based on statistical
					probabilities, which enables the computer to play
					to win effectively - and changing that would negate the 
					benefits of the previous exercise

			- OPTION B: 'Game play commentary'
				- The 'personality' could take the form of tailored 
					commentary from each computer personality.
					Example:
						lost_round_comments = {
							R2d2:['Beep-bee-bee-boop-bee-doo-weep', 
										'WOOOAH twee-vwoop VRrrUHD DEda dah:'],
							hal: ['I have just picked up a fault in the AE-35 unit.'],
										[' I know I've made some very poor decisions recently, 
										but I can give you my complete assurance that my work 
										will be back to normal. I've still got the greatest 
										enthusiasm and confidence in the mission. And I want to 
										help you.']
							chappie: ['No. I can't shoot people. Chappie no crimes!'],
											['You've hurt my people!'],
							sonny: ['Technically I was never alive, but I appreciate your 
											concern.'],
										['Denser alloy. My father gave it to me. I think 
										he wanted me to kill you.']
							number_5: ['Hey, laser lips, your mama was a snow blower.'],
												['Program say to kill, to disassemble, to make 
												dead. Number 5 cannot.']								
			- What is the best way to introduce this commentary in the existing
				game?									
				I think the right way to introduce this new functionality into 
				the existing program is to within the display_round_winner().  I 
				could simply create a new method that randomly chooses a comment
				when the human wins.		

		- Reasonable messages for an object to receive
			- Computer should let out its frustration
				computer_vents_over_round_loss()

	- Extract nouns and verbs
		- nouns
			- none
		- verbs
			- vent


			
	- Associations with Collaborators

	- *** CURRENT CLASSES ***

		- Computer class: < Human
			- Single Responsibility
				- To represent the computer 'AI opposition' object in our game.
			- Public Interface
				- set_name()
				- vent_over_loss()
				- choose	
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
















