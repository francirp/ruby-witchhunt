class Character

  def initialize(args = {})
  end

  def team
    Team::GOOD
  end

  def evil?
    team == Team::EVIL
  end

  def good?
    team == Team::GOOD
  end

end