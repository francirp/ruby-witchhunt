class Phase

  attr_reader :number, :game

  def initialize(args = {})
    @number = args[:number]
    @game = args[:game]
    after_init(args)
  end

  def run
    steps.each do |step|
      step.run
    end
    finish_game if game.should_end?
  end

  def first_night?
    self.class == "FirstNight"
  end

  def night?
    self.class == "Night"
  end

  def day?
    self.class == "Day"
  end

  private

    def after_init(args = {})
      # implemented by subclass
    end

    def steps
      # implemented by subclass
    end

end