# BUNDLER
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require_relative "folder_requirer"

base_files = %w(character game option phase player step team game_generator)
character_files = %w(apprentice demon gravedigger judge peasant priest witch)
phase_files = %w(day night first_night)
step_type_files = %w(actionable_step static_step)
step_files = %w(apprentice_step)

FolderRequirer.new(folder_path: nil, file_names: base_files)
FolderRequirer.new(folder_path: "character", file_names: character_files)
FolderRequirer.new(folder_path: "phase", file_names: phase_files)
FolderRequirer.new(folder_path: "step/types", file_names: step_type_files)
FolderRequirer.new(folder_path: "step", file_names: step_files)

GameGenerator = GameGenerator.new

Game.new(players: GameGenerator.players).play
