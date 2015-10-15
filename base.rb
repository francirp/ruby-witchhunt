# BUNDLER
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require_relative "folder_requirer"

base_files = %w(character game option phase player step team game_generator)
character_files = %w(apprentice demon gravedigger judge peasant priest witch angel)
phase_files = %w(day night first_night)
step_type_files = %w(actionable_step static_step player_step)
step_files = %w(apprentice_step wake_up_witches_step villager_vote_step judge_step gravedigger_step demon_step angel_step witch_step priest_step)

FolderRequirer.new(folder_path: nil, file_names: base_files)
FolderRequirer.new(folder_path: "character", file_names: character_files)
FolderRequirer.new(folder_path: "phase", file_names: phase_files)
FolderRequirer.new(folder_path: "step/types", file_names: step_type_files)
FolderRequirer.new(folder_path: "step", file_names: step_files)

puts "How many players are there?"
players = gets.chomp.to_i
while players < 7
  puts "You must have at least 7 players. How many do you want?"
  players = gets.chomp.to_i
end

game_generator = GameGenerator.new(players: players)

Game.new(players: game_generator.players).play
