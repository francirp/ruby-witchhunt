class Step

  attr_reader :phase
  attr_accessor :response, :valid

  def initialize(args = {})
    @phase = args[:phase]
    raise "phase must be passed to #{self.class.name}" if @phase.nil?
    after_init(args)
  end

  def run
    raise "all steps must implement run method"
  end

  def should_happen?
    true
  end

  private

    def game
      phase.game
    end

    def players
      game.players
    end

    def message
      raise "all steps must implement message method"
    end

    def retrieve_response
      @response = gets.chomp
    end

    def check_if_valid_response
      raise "all steps must implement check_if_valid_response method"
    end

    def after_init(args = {})
      # optionally implemented by class
    end

end