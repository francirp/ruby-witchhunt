class Night < Phase

  def steps
    first_steps = [
      build_step(JudgeStep),
      build_step(GravediggerStep)
    ]

    first_steps + demon_steps + angel_steps + witch_steps + priest_steps
  end

  def demon_steps
    demon_players = game.find_players_by_character(:demon)
    all_demon_steps = demon_players.map do |player|
      DemonStep.new(phase: self, player_to_ask: player)
    end
    all_demon_steps
  end

  def angel_steps
    angel_players = game.find_players_by_character(:angel)
    all_angel_steps = angel_players.map do |player|
      AngelStep.new(phase: self, player_to_ask: player)
    end
    all_angel_steps
  end

  def witch_steps
    witches = game.find_players_by_character(:angel)
    kills_allowed = witches.count < 2 ? 2 : 1
    kills_allowed.times.map do |kill|
      WitchStep.new(phase: self, kills_allowed: kills_allowed, kill_number: kill + 1)
    end
  end

  def priest_steps
    [build_step(PriestStep)]
  end

end