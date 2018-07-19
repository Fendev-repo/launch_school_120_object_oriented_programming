# Assignment: OO Rock Paper Scissors

## Bonus Features
### Exercise: Keeping Score 

### Exercise description
Right now, the game doesn't have very much dramatic flair. It'll be more interesting if we were playing up to, say, 10 points. Whoever reaches 10 points first wins. Can you build this functionality? We have a new noun -- a score. Is that a new class, or a state of an existing class? You can explore both options and see which one works better.

### PEAOS
	- Problem
		- How do I define what a point is?
			- points will just be an Integer
		
		- How do I store/maintain the score during the execution of the script?
			- Store the score in a Hash { player: 1, :computer 2 }
		
		- how do I count points?
			- hsh[:player] => 1
			- hsh[:computer] => 2

		- How do I increase score?
			- hsh[:player] += 1
			- hsh[:computer] += 1

		- How do I identify a winner?
			hsh.each { |k, v| return true if v >= 10 }

		- What object should keep the score?
			- Scorecard object

		- What are reasonable messages for the receiving object(s)
			- what is the current score?
				score()

			- has anyone reached 10 points yet?
				winning_score_reached?()
					- Maybe set a default argument of winning_score=10 in the method definition

			- add a point to this players score
				add_point(player)
				add_point(computer)

	- Extract nouns and verbs
		- nouns
			- score
			- score_keeper
		
		verbs
			- get score
			- show score


	- Associations with Collaborators

	- ** CURRENT CLASSES ***

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
				(MAYBE) - Scorecard

		- Player class:
			- Single Responsibility
				- To represent the 'Abstract Class' for Humans and Computers to inherit from
			- Public Interface
				- none currently
			- Collaborator Objects
				- none currently	  			

	- ** END CURRENT CLASSES ***
	- ** NEW SOLUTION CLASS(ES) ***

		Scorecard class:
			- Single Responsibility
				- To represent the scorecard of round wins for each game played
			- Public Interface
				- score()
				- winning_score_reached?()
				- add_point_for_player()
				- add_point_for_computer()
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
			- display_scorecard() # This needs to be added
			- human.choose()
			- computer.choose()
			- display_moves()
			- update_scorecard
				- add_point_for_player()
				- add_point_for_player()
			- display_round_winner()

			- next unless winning_score_reached? # => true or false
			- display_scorecard
			- break unless play_again?

	- Spike

















