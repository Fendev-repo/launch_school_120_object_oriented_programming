# Assignment: OO Tic Tac Toe

## Exercise description
Our TTTGame#play method reads very well. Most methods there are declarative. That is, we are just giving high level commands, like "display_board", "human_moves", and we're not focused on the imperative step-by-step instructions of how to do those things. Operating at this higher level of abstraction allows us to orchestrate the sequence of actions and organize the game flow much easier. However, we deviate a bit towards the end of the method after play_again?.
For example, the below code after play_again? is very imperative in nature

```ruby
def play
  # ... rest of method omitted for brevity

  break unless play_again?
  board.reset
  clear
  puts "Let's play again!"
  puts ""
end
```
We should extract it to a well-named method to keep the TTTGame#play method at a declarative level. Let's move all of that into a method called TTTGame#reset.


### Problem decomposition - PEDAC (Method level problem solving)
	- Description
		- This exercise is another refactor -  I just need to move
		four lines of related behavior into a single method 
	- Sub-problems

### Examples
	- Implementation:

		def reset
			board.reset
  		clear
  		puts "Let's play again!"
  		puts ""
		end
		
### Data structures
### Algorithm
### Code