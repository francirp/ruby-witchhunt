class FirstNight < Phase

  def after_init(args = {})
    @number = 1
  end

  def steps
    [
      build_step(ApprenticeStep),
      build_step(WakeUpWitchesStep)
    ]
  end

end