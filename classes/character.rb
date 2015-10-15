class Character

  attr_reader :type, :ability, :team

  module Team
    WITCH = :evil
    VILLAGER = :good
  end

  def initialize(args = {})
    @type = args[:type]
    @ability = args[:ability]
  end

  def team
    Team::VILLAGER
  end

end