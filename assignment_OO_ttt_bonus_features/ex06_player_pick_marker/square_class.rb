# Object which represents marker in game
class Square
  INITIAL_MARKER = ' '.freeze

  attr_accessor :marker

  def initialize(key_no, marker = INITIAL_MARKER)
    @marker = marker
    @key_no = key_no
  end

  def key_num
    @key_no
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end
