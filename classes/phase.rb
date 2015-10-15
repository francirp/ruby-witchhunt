class Phase

  attr_reader :number, :game

  def initialize(args = {})
    @number = args[:number]
    @game = args[:game]
    after_init(args)
  end

  def run
    puts "starting #{self.class.name} on day #{number} phase"
    steps.each do |step|
      step.run if step.should_happen?
    end
    finish_game if game.should_end?
  end

  def first_night?
    self.class.name == "FirstNight"
  end

  def night?
    self.class.name == "Night"
  end

  def day?
    self.class.name == "Day"
  end

  private

    def after_init(args = {})
      # implemented by subclass
    end

    def steps
      # implemented by subclass
    end

    def build_step(step_class)
      step_class.new(phase: self)
    end

    def finish_game
      game.finished = true
    end

end