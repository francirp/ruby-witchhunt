module PlayerStep

  attr_reader :player_to_ask

  def after_init(args = {})
    @player_to_ask = args[:player_to_ask]
    super(args)
  end

end