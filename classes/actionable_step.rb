class ActionableStep < Step

  def get_response
    puts moderator_message
    response = gets.chomp.to_i
    target = response
  end

end