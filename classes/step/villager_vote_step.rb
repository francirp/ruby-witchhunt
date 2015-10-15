class VillagerVoteStep < Step
  include ActionableStep

  NONE_VALUE = "none"

  def options
    options = game.surviving_players.map do |player|
      Option.new(value: player.id, label: player.name)
    end
    none = Option.new(value: NONE_VALUE, label: "Vote ran out of time.")
    options << none
    options
  end

  def action
    player = game.find_player_by_id(parsed_response)
    if parsed_response != NONE_VALUE
      player.vote_off!
      phase.decided = true
    else
      phase.decided = false
    end
  end

  def ask
    "Villagers, which player would you like to eliminate? You have 6 minutes to decide."
  end

  def parsed_response
    response
  end
end