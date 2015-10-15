module StaticStep

  def run
    @valid = false
    while !valid
      puts message
      puts "Please type next once this step has been completed."
      retrieve_response
      check_if_valid_response
    end
  end

  private

    def check_if_valid_response
      @valid = true if response == "next"
    end

end