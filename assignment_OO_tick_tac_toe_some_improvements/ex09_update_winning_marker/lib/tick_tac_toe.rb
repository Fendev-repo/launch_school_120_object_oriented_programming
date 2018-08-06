require_relative 'board_class'
require_relative 'player_class'
require_relative 'interactable_module'
require 'pry-byebug'

# Responsible for orchestrating the TTT game play
class TTTGame
  include Interactable

  HUMAN_MARKER = 'X'.freeze
  COMPUTER_MARKER = 'O'.freeze

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def reset
    board.reset
    clear_cli
    print_lets_play_again
  end

  def players
    { human: human, computer: computer }
  end

  def play
    clear_cli
    display_welcome_message

    loop do
      board.display_board(players)
      loop do
        human_moves
        break if board.someone_won? || board.full?

        computer_moves
        break if board.someone_won? || board.full?

        clear_cli
        board.display_board(players)
      end
      display_result
      break unless play_again?
      reset
    end
    display_goodbye_message
  end
end

# we'll kick off the game like this
game = TTTGame.new
game.play
