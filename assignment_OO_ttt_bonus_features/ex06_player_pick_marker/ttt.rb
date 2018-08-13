require_relative 'board_class'
require_relative 'square_class'
require_relative 'cli_display_module'
require_relative 'game_play_module'

# Object which orchestrates game
class TTTGame
  FIRST_TO_MOVE = 'choose'.freeze

  include DisplayMessagesCli
  include GamePlayMethods

  attr_reader :board, :human, :computer, :score, :marker_selection,
              :computer_name, :human_name

  def initialize
    @board = Board.new
    @current_marker = FIRST_TO_MOVE
    @first_to_move = nil
    @score = { human: 0, computer: 0 }
    @marker_selection = { human: 'X', computer: 'O' }
    @computer_name = ['Hal900', 'Photocopier From Work', 'Robot123'].sample
    @human_name = nil
  end

  # rubocop:disable MethodLength
  # rubocop:disable Metrics/AbcSize
  def play
    prep_new_game
    # Play loop - break when player is finished playing program.
    loop do
      # Game loop - break when the winning score is reached
      loop do
        display_board
        # Round loop - break when round is won or tied
        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          clear_screen_and_display_board if human_turn?
        end

        update_score
        display_result
        break if winning_score_reached?
        reset
        reset_first_player
      end

      break unless play_again?
      reset_board_and_score
      reset_first_player
    end

    display_goodbye_message
  end
  # rubocop:enable MethodLength
  # rubocop:enable Metrics/AbcSize

  private

  def prep_new_game
    clear
    display_welcome_message
    ask_human_for_name
    ask_human_for_marker_choice
    choose_who_moves_first
    board.upate_marker_selection(@marker_selection)
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def reset
    board.reset
    clear
  end

  def reset_board_and_score
    reset
    @score = { human: 0, computer: 0 }
  end
end
game = TTTGame.new
game.play
