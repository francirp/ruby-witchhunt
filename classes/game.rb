class Game

  attr_reader :players
  attr_accessor :current_phase, :finished, :phases

  def initialize(args = {})
    @players = args[:players]
    @finished = false
    @phases = []
  end

  def play
    @current_phase = FirstNight.new(game: self)
    while !finished
      @phases << @current_phase
      @current_phase.run
      @current_phase = next_phase
    end
    puts winning_team_message
  end

  def surviving_players
    players.find_all { |player| player.alive? }
  end

  def surviving_good_players
    surviving_players.find_all { |player| player.alive? && player.character.good? }
  end

  def surviving_evil_players
    surviving_players.find_all { |player| player.alive? && player.character.evil? }
  end

  def surviving_players_other_than_character(value)
    surviving_players.find_all { |player| player.character.value != value }
  end

  def should_end?
    evil_won? || good_won?
  end

  def evil_won?
    surviving_evil_players.count >= surviving_good_players.count
  end

  def good_won?
    surviving_evil_players.count == 0
  end

  def find_players_by_character(value)
    players.find_all { |player| player.character.value == value }
  end

  def find_player_by_id(id)
    players.detect { |player| player.id == id }
  end

  def last_phase
    phases[-2]
  end

  def winning_team_message
    team = evil_won? ? "evil" : "good"
    return "The #{team} team won!"
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