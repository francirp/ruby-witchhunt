class Player

  attr_accessor :id, :character, :ability

  def initialize(args = {})
    @id = args[:id]
    @character = args[:character]
    @ability = args[:ability]
  end

end