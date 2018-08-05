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
    winning_marker ? winning_marker : nil
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

  def win_line_occupied?(ary)
    squares[ary[0]].marker != ' ' &&
      squares[ary[1]].marker != ' ' &&
      squares[ary[2]].marker != ' '
  end

  def win_patterns
    WINNING_LINES.select do |line|
      win_line_occupied?(line)
    end
  end

  def winning_pattern_markers_not_uniform?
    ary = win_patterns
    first_marker  = squares[ary[0][0]].marker
    second_marker = squares[ary[0][1]].marker
    third_marker  = squares[ary[0][2]].marker
    [first_marker, second_marker, third_marker].uniq.length > 1
  end

  def what_is_the_winning_marker
    ary = win_patterns
    squares[ary[0][0]].marker
  end

  def no_winning_patterns_are_ocupied?
    win_patterns.empty?
  end

  #  Needs to return 'X' or 'O' or nil
  def winning_marker
    return nil if no_winning_patterns_are_ocupied?
    return nil if winning_pattern_markers_not_uniform?
    what_is_the_winning_marker
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
end
