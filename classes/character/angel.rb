class Angel < Character

  def team
    Team::GOOD
  end

  def value
    :angel
  end

  def label
    "Angel"
  end

  def self.allowed_at_start?
    false
  end

  def self.required_at_start?
    false
  end

end