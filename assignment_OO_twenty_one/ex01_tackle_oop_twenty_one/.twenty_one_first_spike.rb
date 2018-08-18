class Player
  def initialize
    # What would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
    # definitely looks like we need to know about "cards" to produce some
    # total
  end
end

class Dealer
  def initialize
    # Seems like very similar to Player... do we need this?
  end

  def deal
    # Does the dealer or the Deck deal?
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
  end
end

class Participant
  # What goes in here? all the redundant behaviors from Player and Dealer? 
end


class Deck
  def initialize
    # Obviously, we need some data structure to keep track of cards
    # Array, Hash, something else?
  end

  def deal
    # Does the dealer of the deck deal?
  end
end


class Card
  def initialize
    # What are the "states" of a card?
  end
end

class Game
  def start
    # What's the sequence of steps to execute the game plan?
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start





























