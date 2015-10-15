class Day < Phase

  attr_accessor :decided

  def after_init(args = {})
    @decided = false
  end

  def steps
    [
      build_step(VillagerVoteStep)
    ]
  end

  def not_decided?
    !decided
  end

end