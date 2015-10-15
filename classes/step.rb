class Step

  attr_reader :phase
  attr_accessor :response

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

end