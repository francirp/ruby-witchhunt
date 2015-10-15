module ActionableStep

  def run
    @valid = false
    while !valid
      puts message
      retrieve_response
      check_if_valid_response
    end
    action
    puts
  end

  private

    def options
      # implemented by class
      raise "options is a required method for an actionable step"
    end

    def action
      # implemented by class
      raise "action is a required method for an actionable step"
    end

    def ask
      # implemented by class
      raise "ask is a required method for an actionable step"
    end

    def parsed_response
      response
    end

    def check_if_valid_response
      option = options.detect { |option| option.value == parsed_response }
      @valid = option.present?
    end

    def options_message
      option_messages = options.map do |option|
        "#{option.value} for #{option.label}"
      end
      option_messages.join(", ").prepend("(") << ")"
    end

    def message
      [ask, options_message].join(" ")
    end

end