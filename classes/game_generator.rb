class GameGenerator

  attr_accessor :players, :number_players

  def initialize(args = {})
    @number_players = args.fetch(:number_players, 10)
    generate
  end

  private

    def generate
      @players = generate_starting_players
    end

    def generate_starting_players
      players = Character.character_types_required_to_start.map do |character_type|
        players_for_character = character_type.characters_needed_for(number_players).times.map do |i|
          generate_character_and_player(character_type, i)
        end
        players_for_character
      end
      players.flatten!
      while players.count < number_players
        peasants = players.find_all { |player| player.character.value == :peasant }
        players << generate_character_and_player(Peasant, peasants.count)
      end
      return players
    end

    def generate_character_and_player(character_type, id)
      character = character_type.new
      player = Player.new
      player.id = "#{character.value}_#{id}"
      player.name = player.id
      player.character = character
      player
    end

end