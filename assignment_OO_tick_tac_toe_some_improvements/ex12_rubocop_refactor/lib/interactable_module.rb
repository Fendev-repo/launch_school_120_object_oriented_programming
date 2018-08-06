require 'pry-byebug'
require_relative 'board_class'

# Responsible for keeping all the methods that interact with the terminal
module Interactable
  def print_lets_play_again
    puts "Let's play again!"
    puts ''
  end

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  # rubocop:disable Metrics/AbcSize
  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')})"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
  end
  # rubocop:enable Metrics/AbcSize

  def display_result
    clear_cli
    board.display_board(human: human, computer: computer)
    case board.winning_marker
    when human.marker
      puts 'You won!'
    when computer.marker
      puts 'Computer won!'
    else
      puts "It's a tie!"
    end
  end

  def clear_cli
    system 'clear'
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Sorry, must be y or n'
    end
    answer == 'y'
  end
end
