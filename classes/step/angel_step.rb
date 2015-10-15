class AngelStep < Step
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
    player.bless!
  end

  def ask
    "(you are talking to #{player_to_ask.name}): Angel, which player would you like to bless?"
  end

  def parsed_response
    response
  end
end