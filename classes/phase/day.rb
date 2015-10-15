class Day < Phase

  def steps
    [
      build_step(VillagerVoteStep)
    ]
  end

end