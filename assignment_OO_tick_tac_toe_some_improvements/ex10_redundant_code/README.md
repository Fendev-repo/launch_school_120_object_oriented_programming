# Assignment: OO Tic Tac Toe

## Exercise description
Our code is looking good, but there's a little bit of redundant code in the main game loop. The code below has a pattern that seems ripe for extraction, can you see it?

```ruby
loop do
  human_moves
  break if board.someone_won? || board.full?

  computer_moves
  break if board.someone_won? || board.full?

  clear_screen_and_display_board
end
```
It'd be nice to be able to introduce some notion of a "current player", and we could then remove the redundancy, like this:

```ruby
loop do
  current_player_moves
  break if board.someone_won? || board.full?
  clear_screen_and_display_board if human_turn?
end
```
The trick is to alternate the "current player" after each turn. How can we do this?



### Problem decomposition - PEDAC (Method level problem solving)
	-	Description
		- A simply refactor to adhere to the new game flow logic.
	- Sub-problems


### Examples
### Data structures
### Algorithm
### Code
