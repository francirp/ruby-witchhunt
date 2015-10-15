class GameGenerator

  attr_accessor :players

  # REQUIRED_GOOD_CHARACTERS = [Priest.new, Gravedigger.new, Judge.new, ]

  def initialize(args = {})
    generate
  end

  def generate
    create_players
  end

  private

    def create_players
      players = [Apprentice.new, Judge.new, Peasant.new, Peasant.new, Witch.new, Witch.new, Peasant.new, Peasant.new]
    end

end