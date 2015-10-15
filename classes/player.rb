class Player

  attr_accessor :id, :character

  def initialize(args = {})
    @id = args[:id]
    @character = args[:character]
  end

end