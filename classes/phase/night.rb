class Night < Phase

  def steps
    first_steps = [
      build_step(JudgeStep),
      build_step(GravediggerStep)
    ]

    first_steps + demon_steps
  end

  def demon_steps
    demon_players = game.find_players_by_character(:demon)
    all_demon_steps = demon_players.map do |player|
      DemonStep.new(phase: self, player_to_ask: player)
    end
    all_demon_steps
  end

end