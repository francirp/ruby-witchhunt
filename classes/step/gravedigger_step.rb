class GravediggerStep < Step
  include StaticStep

  def message
    "Gravedigger, wake up. I will now point to the player that was last killed."
  end

end