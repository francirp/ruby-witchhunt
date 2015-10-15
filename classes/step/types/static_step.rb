module StaticStep

  def run
    while response != "next"
      puts message
      puts "Please type next once this step has been completed."
      retrieve_response
      puts "Your answer was not valid. It must be 'next' in order to continue."
    end
  end



end