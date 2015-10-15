class ApprenticeStep < Step
  include ActionableStep

  def options
    [
      Option.new(value: Character::Types::GRAVEDIGGER, label: Character::Types::Labels[GRAVEDIGGER]),
      Option.new(value: Character::Types::PRIEST, label: Character::Types::Labels[PRIEST])
    ]
  end

  def action

    # implemented by class
  end

  def ask
    # implemented by class
  end

end