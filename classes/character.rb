class Character

  attr_accessor :visible_team

  def initialize(args = {})
    @visible_team = team
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

  def self.all_character_types
    [Apprentice, Gravedigger, Judge, Peasant, Priest, Angel, Witch, Demon]
  end

  # def self.all_characters
  #   [Apprentice.new, Gravedigger.new, Judge.new, Peasant.new, Priest.new, Angel.new, Witch.new, Demon.new]
  # end

  # def self.good_characters
  #   all_characters.find_all {|character| character.good? }
  # end

  # def self.evil_characters
  #   all_characters.find_all {|character| character.evil? }
  # end

  def self.allowed_at_start?
    true
  end

  def self.required_at_start?
    true
  end

  def self.characters_needed_for(number_players)
    return 0 unless required_at_start?
    1
  end

  def self.character_types_required_to_start
    all_character_types.find_all { |character_type| character_type.required_at_start? }
  end

end