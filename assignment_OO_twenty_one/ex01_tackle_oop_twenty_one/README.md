# Assignment: OO Twenty-One

## Exercise 
Take a shot at working through the solution. In the reference implementation, we use a Hand module that is mixed into Player and Dealer, but you don't have to do that.

### Problem decomposition

	- Problem desciption
		- Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.

		Here is an overview of the game:
		- Both participants are initially dealt 2 cards from a 52-card deck.
		- The player takes the first turn, and can "hit" or "stay".
		- If the player busts, he loses. If he stays, it's the dealer's turn.
		- The dealer must hit until his cards add up to at least 17.
		- If he busts, the player wins. If both player and dealer stays, then the highest total wins.
		- If both totals are equal, then it's a tie, and nobody wins.

- Sub-problems
	- How will I present the cards for the Player?

		Your hand: [ten_of_hearts, ace_of_spades]
		hand total: (10 + 11) = 21 

		Your hand: [ten_of_hearts, ace_of_spades, two_of_trumps]
		hand total: (10 + 1 + 1) = 12 

		Your hand: [four_of_hearts, two_of_spades, ace_of_trumps]
		hand total: (4 + 2 + 11) = 19
		ALT hand total: (4 + 2 + 1) = 7 

	- How will I present the cards for the Dealer?
		First two dealt dealer cards [hidden_card, ten_of_hearts]
		Dealers hit cards []
		Dealers hand total 

	- How will I confirm which hand is better? 
		- Maybe override the Hand#> Hand#< method to compare hands
	- How will I manage the game score?
	- How will I ensure that the dealer chooses wisely - 
		and can play to win
	- dealer AI

	- What will an individual card look like?
		two_of_spades: { value: 2, alternative_value: nil}
		ace_of_spades: { value: 11, alternative_value: 1 }


	- What will a Deck of cards look like?
		@deck = { two_of_spades: { value: 2, alternative_value: nil, 
							ace_of_spades: { value: 11, alternative_value: 1 }
						}	

	- What are the messages that I will be sending the @deck
		- what cards are yet to be dealt
			@deck

		- deal specified number of cards - in a random fashion 
			(which will mutate the deck)
			@deck.deal(:human, 2) # mutates the @deck and human hand
			@deck.deal(:dealer, 1) # mutates the @deck and dealer hand

	- What are the messages that I will be sending the hand
		- is this hand's score better than this hand
			def who_won
				human.hand > dealer.hand ? :human : :dealer 
			end

			def best_score_available_for_hand
				
			end		

		- what is this hands score
		- if there is an ace - what is the alternative score



### Extract nouns and verbs
	- Nouns: card, player, dealer, participant, deck, game, total
	- Verbs: deal, hit, stay, busts

		- Player
			- hit
			- stay
			- busted?
			- total
		- Dealer
			- hit
			- stay
			- busted?
			- total
			- deal (Should this be here, or in Deck?)
		- Participant
		- Deck
			- deal (Should this be here, or in Dealer?)
		- Card
		- Game
			- Start

### Spike

### CRC

	- CLASS Competitor
	- Responsibilities
		- decides whether to hit or stay
		- tries to beat the other player(s)
	- Collaborators
		- Hand

	- CLASS Hand
	- Responsibilities
		- holds a competitors cards
		- adds up hand total(s)
		- enables dealer hand concealment
		- enables dealer hand presentation
		- enables presentation of hands
		- enables boolean comparison with other hands > or <
		- provides options when hand has an ace or aces 
	- Collaborators
		- Card

	- CLASS Deck
	- Responsibilities
		- enables a practical container for all cards
		- enables random selection for 'dealing' cards
		- enables shuffling to enable random order of cards 
		- enables dealing of specified number of random cards
		- enables reduction of available cards if they have been delt
	- Collaborators
		- Card

	- CLASS Card
	- Responsibilities
		- enables a practical container for a cards attributes
		- enables a practical container to access value(s) of card
	- Collaborators
		- None currently

	- CLASS Game
	- Responsibilities
		Maintains the game status
			- Keeps the score
			- keeps the number of rounds
			- keeps the current round
			- Whos turn?
			- Dealer show cards or not
			- player round status busted or not?
			- Dealer round status busted or not?

		- orchestrates the game play
		- knows whos turn it is
		- confirms if a round is over
		- confirms if a game is over
		- congratulates winner
	- Collaborators
		- Competitor(s)
		- Deck


### Orchestration engine
	
	- Game Loop Start # end when player is finished playing game

		- Welcome Player to 21 if score if scoreboard 
		- Ask player for how many rounds they would like to play - best of? (3,6,9?) 
		- Welcome Player to new round - present round number
		- Increment the round number

		- Round loop Start # break when there is a winner of games
			- Setup round
				- Deal two cards for dealer - and only show one
				- Deal first two cards for player
				- present_table
					- render hands with one of dealers cards concealed
					- show score
					- show round number
					- present player hand options

				- Players Hit Stack Loop # break when player stays or busts	
					- Obtain player decision to hit or stay
					- Break if player busted
					- present_table
						- render hands
						- show score
						- show round number
						- present player hand options
				- Players Hit Stack End 	

				- Dealers Hit Stack Loop # break when dealer wins or busts	
					- Obtain dealer decision to hit or stay
					- Break if dealer busted
					- present_table
						- render hands
						- show score
						- show round number
						- present player hand options
				- Dealers Hit Stack End 

				Compare hands and update score 
				Next iteration if current round number less than number of games to play
				break
				
		- Round loop End
			- break unless player want another game
			- Thank players for playing

	- Game loop End














