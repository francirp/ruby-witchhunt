class VillagerVoteStep < Step
  include ActionableStep

  def options
    options = game.surviving_players.map do |player|
      Option.new(value: player.id, label: player.name)
    end
    none = Option.new(value: "none", label: "Vote ran out of time.")
    options << none
    options
  end

  def action
    player = game.find_player_by_id(parsed_response)
    player.kill!
  end

  def ask
    "Which player would you like to kill? You have 6 minutes to decide."
  end

  def parsed_response
    response
  end
end