class JudgeStep < Step
  include ActionableStep

  def options
    options = game.surviving_players.map do |player|
      Option.new(value: player.id, label: player.name)
    end
    options
  end

  def action
    player = game.find_player_by_id(parsed_response)
    player.vote_off!
  end

  def ask
    "Judge, since the villagers can't decide on anything, which player would you like to eliminate?"
  end

  def parsed_response
    response
  end

  def should_happen?
    game.last_phase.not_decided?
  end
end