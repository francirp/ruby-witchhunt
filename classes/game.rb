class Game

  attr_reader :players
  attr_accessor :day

  def initialize(args = {})
    @players = args[:players]
    @day = 0
  end

end