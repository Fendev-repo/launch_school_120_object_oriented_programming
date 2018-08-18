require_relative 'cli_display_module'
require_relative 'Competitor_class'
require_relative 'deck_class'
require_relative 'keep_score_module'
require_relative 'game_status_module'

# Object responsibile for orchestrating game play
# rubocop:disable ClassLength
class Game
  NUM_ROUND_OPTIONS = [3, 6, 9].freeze
  HIT = 'h'.freeze
  STAY = 's'.freeze
  CUDOS = ['wow, you are good',
           'You are the ace',
           "It's too easy for you",
           'We got a shark here'].sample

  include CliDisplay
  include KeepScore
  include GameStatus

  def initialize
    @human = Competitor.new(:human)
    @dealer = Competitor.new(:dealer)
    @deck = shuffle_new_deck
    @score_card = new_score_card
  end

  def start
    # Game loop - exit when player is finished playing game
    loop do
      # Round loop - exit when specified number of rounds are complete
      pre_play_setup

      take_a_turn :human
      take_a_turn :dealer unless hand_is_busted? :human

      update_present_and_reset

      next unless all_rounds_have_been_played?
      break unless human_wants_to_a_play_another_game?
    end
    thank_players_for_game
  end

  private

  def update_present_and_reset
    update_score_card
    present_round_result
    reset_hand
  end

  def pre_play_setup
    prep_game
    clear_cli
    deal_first_two_cards_to_players
    present_table
  end

  def shuffle_new_deck
    @deck = Deck.new
  end

  def reset_hand
    @human.reset_hand
    @dealer.reset_hand
    sleep 3 # Allows the player 2 seconds to review round outcome
    clear_cli
  end

  def shuffle_welcome_and_introductions
    shuffle_new_deck
    welcome_players
    collect_human_players_name
    confirm_number_of_rounds_for_game
  end

  def prep_game
    status = game_status

    if status == :new_game
      shuffle_welcome_and_introductions
    elsif status == :play_again
      shuffle_new_deck
      confirm_number_of_rounds_for_game
    else
      welcome_players_to_next_round
    end
  end

  def take_a_turn(competitor)
    case competitor
    when :human   then hit_stay_or_bust_process :human
    when :dealer  then hit_stay_or_bust_process :dealer
    end
  end

  def clear_and_present_table
    clear_cli
    present_table
  end

  # rubocop:disable MethodLength
  def hit_stay_or_bust_process(competitor)
    return dealer_ai_play if competitor == :dealer

    print_to_cli "Please enter 'h' for hit, or 's' for stay."
    msg = 'I need to know if you want to hit or stay?'

    loop do
      decision = collect_input msg, '^[hs]'
      update_hand decision
      clear_and_present_table

      break if decision.match?('^[s]')
      break if hand_is_busted? competitor

      print_to_cli 'Ok - now hit or stay?'
    end
  end
  # rubocop:enable MethodLength

  def dealer_ai_play
    loop do
      if @dealer.best_hand_option <= @human.best_hand_option
        update_hand(HIT, :dealer)
      end
      break if @dealer.hand_busted?
      break if @dealer.best_hand_option > @human.best_hand_option
    end
    sleep 1
  end

  def update_hand(decision = HIT, competitor = :human)
    decision = decision.downcase
    return if decision == STAY

    case competitor
    when :human then @human.add_to_hand(@deck.deal(1))
    when :dealer then @dealer.add_to_hand(@deck.deal(1))
    end
  end

  def deal_first_two_cards_to_players
    [@human, @dealer].each do |competitor|
      @deck.deal(2).each do |hsh_card|
        competitor.current_hand << hsh_card
      end
    end
  end
end
# rubocop:enable ClassLength
Game.new.start
