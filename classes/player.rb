class Player

  attr_accessor :name, :id, :character, :alive

  def initialize(args = {})
    @name = args[:name]
    @id = args[:id]
    @character = args[:character]
    @alive = true
  end

  def kill!
    @alive = false
    @character = Demon.new if character.evil?
    @character = Angel.new if character.good?
  end

  def curse!
    new_team = character.evil? ? Team::GOOD : Team::EVIL
    character.visible_team = new_team
  end

  def alive?
    alive
  end

end