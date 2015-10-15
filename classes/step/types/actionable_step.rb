module ActionableStep

  attr_accessor :option_successfully_selected

  def run
    @option_successfully_selected = false
    while !option_successfully_selected
      puts message
      retrieve_response
      check_if_valid_option
    end
    action
  end

  private

    def check_if_valid_option
      option = options.detect { |option| option.value == parsed_response }
      @option_successfully_selected = !option.nil?
    end

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

    def options_message
      option_messages = options.map do |option|
        "#{option.value} for #{option.label}"
      end
      option_messages.join(", or ").prepend("(") << ")"
    end

    def parsed_response
      raise "parsed_response is a required method for an actionable step"
    end

end