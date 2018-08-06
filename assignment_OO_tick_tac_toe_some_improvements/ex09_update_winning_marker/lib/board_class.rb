require_relative 'square_class'

# Responsible for representing the board for each TTT game
class Board
  attr_accessor :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]].freeze

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    winning_marker != nil
  end

  def count_human_marker(sqrs)
    sqrs.collect(&:marker).count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(sqrs)
    sqrs.collect(&:marker).count(TTTGame::COMPUTER_MARKER)
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

  # Returns array of winning lines that are not empty
  def populated_win_lines
    WINNING_LINES.select do |line|
      squares[line[0]].marker != ' ' &&
        squares[line[1]].marker != ' ' &&
        squares[line[2]].marker != ' '
    end
  end

  # Returns winning marker when marker is positioned at each position of
  # winning line
  def win_line_with_uniform_markers
    populated_win_lines.select do |line|
      pos1 = squares[line[0]]
      pos2 = squares[line[1]]
      pos3 = squares[line[2]]
      [pos1.marker, pos2.marker, pos3.marker].uniq.length == 1
    end
  end

  def there_is_a_win_line_with_uniform_markers?
    win_line_with_uniform_markers.empty? ? nil : true
  end

  def win_maker
    winners = win_line_with_uniform_markers[0][0]
    squares[winners].marker
  end

  # returns 'X' or 'O' or nil
  def winning_marker
    return nil if populated_win_lines.empty?
    there_is_a_win_line_with_uniform_markers? ? win_maker : nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
end
