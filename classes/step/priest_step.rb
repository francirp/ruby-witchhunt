class PriestStep < Step
  include ActionableStep

  def options
    options = game.surviving_players_other_than_character(:priest).map do |player|
      Option.new(value: player.id, label: player.name)
    end
    options
  end

  def action
    player = game.find_player_by_id(parsed_response)
    player.inspect!
  end

  def ask
    "Priest, wake up. Point to the player you would like to inspect."
  end

  def parsed_response
    response
  end
end