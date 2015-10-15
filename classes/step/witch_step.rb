class WitchStep < Step
  include ActionableStep

  attr_reader :kills_allowed, :kill_number

  def after_init(args = {})
    @kills_allowed = args[:kills_allowed]
    @kill_number = args[:kill_number]
  end

  def options
    options = game.surviving_good_players.map do |good_player|
      Option.new(value: good_player.id, label: good_player.name)
    end
    options
  end

  def action
    player = game.find_player_by_id(parsed_response)
    player.witch_kill!
  end

  def ask
    if kills_allowed == 1
      "Witches, who would you like to kill?"
    elsif kill_number == kills_allowed
      "Who else would you like to kill?"
    else
      "Witches, you can kill #{kills_allowed} people. Who would you like to kill first?"
    end
  end

  def parsed_response
    response
  end
end