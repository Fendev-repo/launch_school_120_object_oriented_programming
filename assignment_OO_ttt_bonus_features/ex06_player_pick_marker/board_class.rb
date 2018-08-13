# Object which represents the board for game
class Board
  attr_reader :marker_selection

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
    @marker_selection = nil
  end

  def upate_marker_selection(marker_selection)
    @marker_selection = marker_selection
  end

  def []=(num, marker)
    @squares[num].marker = marker
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

  def square_five_available?
    unmarked_keys.include? 5
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      result = three_identical_markers?(squares)
      return squares.first.marker if result == true
    end
    nil
  end

  def square_under_threat
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if two_identical_markers?(squares)
        threat_square = squares.select(&:unmarked?)
        return threat_square.first.key_num
      end
    end
    nil
  end

  def opportunity_to_win
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      next unless two_identical_markers_for_computer?(squares)
      opp_square = squares.select(&:unmarked?)
      next if opp_square.empty?
      return opp_square.first.key_num
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new(key) }
  end

  # rubocop:disable MethodLength
  # rubocop:disable Metrics/AbcSize
  def draw
    puts '     |     |'
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts '     |     |'
  end
  # rubocop:enable MethodLength
  # rubocop:enable Metrics/AbcSize

  private

  def two_identical_markers_for_computer?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    markers.count(marker_selection[:computer]) == 2
  end

  def two_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 2
    markers.min == markers.max
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end
