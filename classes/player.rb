class Player

  attr_accessor :name, :id, :character, :alive

  def initialize(args = {})
    @name = args[:name]
    @id = args[:id]
    @character = args[:character]
    @alive = true
  end

  def kill
    alive = false
  end

  def alive?
    alive
  end

end