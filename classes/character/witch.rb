class Witch < Character

  def team
    Team::EVIL
  end

  def value
    :witch
  end

  def label
    "Witch"
  end

  def self.characters_needed_for(number_players)
    return 2 if number_players <= 8
    return 3 if number_players <= 13
    return 4
  end

end