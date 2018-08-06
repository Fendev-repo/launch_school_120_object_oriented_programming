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
  attr_accessor :players_turn

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @players_turn = true
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def reset
    board.reset
    clear_cli
    print_lets_play_again
    @players_turn = true
  end

  def players
    { human: human, computer: computer }
  end

  def current_player_moves
    if @players_turn
      human_moves
      @players_turn = false
    else
      computer_moves
      @players_turn = true
    end
  end

  def human_turn?
    players_turn == true
  end

  def prep_game
    clear_cli
    board.clear_screen_and_display_board(players)
    display_welcome_message
  end

  def play
    loop do 
      prep_game  

      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        board.clear_screen_and_display_board(players) if human_turn?      
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
