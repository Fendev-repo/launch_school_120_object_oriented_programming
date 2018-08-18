# Object respsonsible for representing a collection of cards
class Deck
  SUITES = [:hearts, :trumps, :spades, :diamonds].freeze
  CARD_VARIANTS = [2, 3, 4, 5, 6, 7, 8, 9, 10] +
                  [:king, :jack, :queen, :ace].freeze
  NUMBER_LABELS = { 2 => 'two', 3 => 'three',
                    4 => 'four', 5 => 'five',
                    6 => 'six', 7 => 'seven',
                    8 => 'eight', 9 => 'nine',
                    10 => 'ten' }.freeze

  attr_reader :deck

  def initialize
    @deck = deal_a_new_deck
  end

  def deal(number_of_cards)
    dealt_cards = []

    number_of_cards.times do
      dealt_cards << take_card_from_deck!
    end
    dealt_cards
  end

  def include?(card_name)
    @deck.include?(card_name)
  end

  def take_card_from_deck!
    return_hsh = {}
    random_card = @deck.to_a.sample
    @deck.delete(random_card[0])
    return_hsh[random_card[0]] = random_card[1]
    return_hsh
  end

  private

  def deal_a_new_deck
    deck = {}

    SUITES.each do |suite|
      CARD_VARIANTS.each do |card_variant|
        card_values = return_card_values(card_variant)
        card_name = return_card_name(suite, card_variant)
        deck[card_name.to_sym] = card_values
      end
    end
    deck
  end

  def return_card_values(card_variant)
    # Card types - number, picture and ace
    number_card = { value: card_variant, alt_value: nil }
    non_ace_picture_card = { value: 10, alt_value: nil }
    ace_picture_card     = { value: 11, alt_value: 1 }

    # If the card variant is a number card - then return that.
    return number_card if card_variant.to_s.match?(/\d{1,2}$/)

    case card_variant
    when :king  then non_ace_picture_card
    when :jack  then non_ace_picture_card
    when :queen then non_ace_picture_card
    when :ace   then ace_picture_card
    end
  end

  def return_card_name(suite, card_variant)
    if card_variant.to_s.match?(/\d{1,2}$/)
      "#{NUMBER_LABELS[card_variant]}_of_#{suite}".to_sym
    else
      "#{card_variant}_of_#{suite}"
    end
  end
end
