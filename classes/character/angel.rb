class Angel < Character

  def team
    Team::EVIL
  end

  def value
    :demon
  end

  def label
    "Demon"
  end

  def self.allowed_at_start?
    false
  end

  def self.required_at_start?
    false
  end

end