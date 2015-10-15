module ActionableStep

  attr_accessor :response

  def run
    message
    retrieve_response
    action
  end

  def retrieve_response
    response = gets.chomp
  end

  def options
    # implemented by class
  end

  def action
    # implemented by class
  end

  def ask
    # implemented by class
  end

end