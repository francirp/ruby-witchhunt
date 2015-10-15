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


# def require_relative_files(folder_path, filenames)
#   filenames.each do |filename|
#     require_relative(folder_path, filename)
#   end
# end

# def require_base_files
#   require_relative_files(".", base_files)
# end


# require_base_files

# classes = %w(ability character apprentice day demon gravedigger judge night peasant player game witch priest step static_step actionable_step)

# classes.each do |klass|
#   require_relative "./classes/#{klass}"
# end


# number_players = 8
# witches = 2
# villagers = 6

# characters = [Witch.new, Witch.new, Priest.new, Gravedigger.new, Judge.new, Apprentice.new, Peasant.new, Peasant.new]

# players = 8.times.map do |i|
#   Player.new(id: i, character: characters[i])
# end



# @game = Game.new(players: players, timeframes: timeframes)

# night_0_steps = [
#   StaticStep.new(moderator_message: "Witches wake up"),
#   ActionableStep.new(moderator_message: "Apprentice, who do you want to shadow? 1 for gravedigger and 2 for priest", action: :shadow, players: )
# ]

# night_0 = Night.new(count: 0, steps: night_0_steps)

# binding.pry