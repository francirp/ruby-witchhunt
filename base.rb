# BUNDLER
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

classes = %w(ability character apprentice day demon gravedigger judge night peasant player game witch priest)

classes.each do |klass|
  require_relative "./classes/#{klass}"
end


number_players = 8
witches = 2
villagers = 6

characters = [Witch.new, Witch.new, Priest.new, Gravedigger.new, Judge.new, Apprentice.new, Peasant.new, Peasant.new]

players = 8.times.map do |i|
  Player.new(id: i, character: characters[i])
end

@game = Game.new(players: players)

night_0_steps = [
  StaticStep.new(moderator_message: "Witches wake up"),
  ActionableStep.new(moderator_message: "Apprentice, who do you want to shadow?", action: :shadow, actionable: Apprentice)
]

binding.pry