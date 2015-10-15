class Step

  attr_reader :phase
  attr_accessor :response, :valid

  def initialize(args = {})
    @phase = args[:phase]
  end

  def run
    # implemented by subclass
  end

  private

    def game
      phase.game
    end

    def players
      game.players
    end

    def message
      # implemented by subclass
    end

    def retrieve_response
      @response = gets.chomp
    end

    def should_happen?
      true
    end

    def check_if_valid_response
      raise "all steps must implement check_if_valid_response method"
    end

end