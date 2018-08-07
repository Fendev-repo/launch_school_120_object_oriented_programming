# Assignment: TTT Bonus Features

## Exercise description
At this point you should have a simple command line Tic Tac Toe game working properly. Let's try to add some additional features.

Improved "join"

If we run the current game, we'll see the following prompt:

```ruby
=> Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, 9
```
This is ok, but we'd like for this message to read a little better. We want to separate the last item with a "or", so that it reads:

```ruby
=> Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, or 9
```

Currently, we're using the Array#join method, which can only insert a delimiter between the array elements, and isn't smart enough to display a joining word for the last element.

Write a method called joinor that will produce the following result:

```ruby
joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
```

Then, use this method in the TTT game when prompting the user to mark a square.