# Object responsible for representing the players of the game
class Competitor
  attr_reader :type
  attr_accessor :current_hand

  def initialize(competitor)
    @type = competitor
    @current_hand = []
  end

  def reset_hand
    self.current_hand = []
  end

  def add_to_hand(new_cards)
    current_hand << new_cards[0]
  end

  def show_hand
    new_ary = []
    current_hand.flatten.each do |item|
      new_ary << item.keys
    end
    new_ary.flatten
  end

  def best_hand_option
    prime, alt = isolate_hand_values
    return prime.sum if prime.sum == alt.sum
    prime.sum > alt.sum ? prime.sum : alt.sum
  end

  def hand_busted?
    win_score = Game::WIN_HAND_SCORE
    prime, alt = isolate_hand_values
    prime.sum > win_score && alt.sum > win_score
  end

  def show_hand_total
    win_score = Game::WIN_HAND_SCORE
    prime, alt = isolate_hand_values
    # If prime and alt are the same - then there
    # is not an alternative hand to present
    alt_hand_available = prime == alt ? false : true

    return prime.sum.to_s unless alt_hand_available
    return "Awesome! you have #{prime.sum}" if prime.sum == win_score

    if prime.sum > win_score
      alt.sum.to_s
    else
      "#{prime.sum} - alternatively: #{alt.sum}"
    end
  end

  # rubocop:disable MethodLength
  # rubocop:disable Metrics/AbcSize
  def isolate_hand_values
    # Isolate primary and alt card values
    # If alt card is a nil - then add the primary value in its place
    # We can then both arrays to choose the best option which needs
    # to be less than max score -i.e. 21
    prime_card_values = []
    alt_card_values = []

    current_hand.each do |item|
      prime_card_values << item.dig(item.keys.first, :value)
      if item.dig(item.keys.first, :alt_value).nil?
        alt_card_values << item.dig(item.keys.first, :value)
      else
        alt_card_values << item.dig(item.keys.first, :alt_value)
      end
    end
    [prime_card_values, alt_card_values]
  end
  # rubocop:enable MethodLength
  # rubocop:enable Metrics/AbcSize
end
