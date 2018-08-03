require 'pry-byebug'

# Responsible for keeping all the methods that interact with the terminal
module Interactable
  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def render_board
    puts "You're a #{human.marker}.  Computer is a #{computer.marker}"
    puts ''
    puts '      |     |'
    puts "   #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts '      |     |'
    puts '-------------------'
    puts '      |     |'
    puts "   #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts '      |     |'
    puts '-------------------'
    puts '      |     |'
    puts "   #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts '      |     |'
    puts ''
  end

  def clear_screen_and_display_board
    clear_cli
    render_board
  end

  def display_board
    render_board
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')})"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board.set_square_at(square, human.marker)
  end

  def display_result
    clear_screen_and_display_board

    case board.detect_winner
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
