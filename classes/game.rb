class Game

  attr_reader :players
  attr_accessor :current_phase, :finished

  def initialize(args = {})
    @players = args[:players]
    @finished = false
  end

  def play
    @current_phase = FirstNight.new(game: self)
    while !finished
      current_phase.run
      @current_phase = next_phase
    end
  end

  def surviving_good_players
    players.find_all { |player| player.alive? && player.character.good? }
  end

  def surviving_evil_players
    players.find_all { |player| player.alive? && player.character.evil? }
  end

  def should_end?
    surviving_evil_players.count >= surviving_good_players.count
  end

  def find_players_by_character(value)
    players.find_all {|player| player.character.value == value }
  end

  private

    def next_phase
      return Day.new(game: self, number: 1) if current_phase.first_night?
      return Day.new(game: self, number: next_day_number) if current_phase.night?
      return Night.new(game: self, number: current_phase.number)
    end

    def next_day_number
      current_phase.number + 1
    end

end