class Player

  attr_accessor :name, :id, :character, :alive, :lives

  def initialize(args = {})
    @name = args[:name]
    @id = args[:id]
    @character = args[:character]
    @lives = 1
    @alive = true
  end

  def witch_kill!
    @lives -= 1
    @alive = false if @lives <= 0
    reincarnate!
  end

  def vote_off!
    @alive = false
    reincarnate!
  end

  def reincarnate!
    @character = Demon.new if character.evil?
    @character = Angel.new if character.good?
  end

  def curse!
    new_team = character.evil? ? Team::GOOD : Team::EVIL
    character.visible_team = new_team
  end

  def bless!
    @lives += 1
  end

  def inspect!
    puts character.visible_team
  end

  def alive?
    alive
  end

end