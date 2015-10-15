class ApprenticeStep < Step
  include ActionableStep

  private

    def options
      gravedigger = Gravedigger.new
      priest = Priest.new
      [
        Option.new(value: gravedigger.value, label: gravedigger.label),
        Option.new(value: priest.value, label: priest.label)
      ]
    end

    def message
      [ask, options_message].join(" ")
    end

    def parsed_response
      response.to_sym
    end

    def action
      player = game.find_players_by_character(parsed_response).first
      player.character = parsed_response.to_s.classify.constantize.new
    end

    def ask
      "Apprentice, wake up. Which do you want to become?"
    end

end