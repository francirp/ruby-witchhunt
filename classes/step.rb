class Step

  attr_reader :time_limit, :moderator_message
  attr_accessor :response

  def initialize(args = {})
    @time_limit = args[:time_limit]
    @moderator_message = args[:moderator_message]
    @action = args[:action]
  end

end