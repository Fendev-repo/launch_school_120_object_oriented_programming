# Object which represents player in game
class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end
