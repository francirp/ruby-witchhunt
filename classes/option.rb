class Option

  attr_reader :value, :label

  def initialize(args = {})
    @value = args[:value]
    @label = args[:label]
  end
end