require_relative 'square_class'

# Responsible for representing the board for each TTT game
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def count_human_marker(squares)
    squares.collect(&:marker).count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(squares)
    squares.collect(&:marker).count(TTTGame::COMPUTER_MARKER)
  end

  def display_board(markers = {})
    human = markers[:human].marker
    computer = markers[:computer].marker
    puts "You're a #{human}.  Computer is a #{computer}"
    render_board
  end

  def render_board
    puts ''
    puts '      |     |'
    puts "   #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts '      |     |'
    puts '-------------------'
    puts '      |     |'
    puts "   #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts '      |     |'
    puts '-------------------'
    puts '      |     |'
    puts "   #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts '      |     |'
    puts ''
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      if count_human_marker(@squares.values_at(*line)) == 3
        return TTTGame::HUMAN_MARKER
      elsif count_computer_marker(@squares.values_at(*line)) == 3
        return TTTGame::COMPUTER_MARKER
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
end
