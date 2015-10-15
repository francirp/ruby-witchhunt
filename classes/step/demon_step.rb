class DemonStep < Step
  include ActionableStep
  include PlayerStep

  def options
    options = game.surviving_good_players.map do |good_player|
      Option.new(value: good_player.id, label: good_player.name)
    end
    options
  end

  def action
    player = game.find_player_by_id(parsed_response)
    player.curse!
  end

  def ask
    "(you are talking to #{player_to_ask.name}): Demon, which player would you like to curse?"
  end

  def parsed_response
    response
  end
end