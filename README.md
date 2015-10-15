# Ruby-Witchhunt

To play the WitchHunt game, pull down this repo and run:

`ruby base.rb`

We completed this challenge for a Ruby Hack Night.

To see all the rules check them out [here](http://chocolatepi.net/rules/).

Have fun and stay alive!


# API for Modifying

## Phases

Currently, there are three types of phases: FirstNight, Day, and Night. Each phase has steps.

For example, on the first night of the game, an apprentice must decide to become a Grave Digger or a Priest. Then the witches must wake up and identify each other. We refer to both of these as steps.

## Steps

A step can be Actionable, Static, and/or specific to one player.

Examples:
  - Actionable Step: the apprentice step mentioned above would be actionable, since the apprentice must make a decision.
  - Static Step: the grave digger step mentioned above would be static, since the gravedigger merely needs to wake up and acknowledge to the moderator.
  - Player Step: this type of step is where a specific player needs to be addressed (instead of the whole group, as in the villager vote step)


To add a new step, create a new class in classes/steps and make sure it inherits from Step. Then add it to step_files array in base.rb.

### ActionableStep

An ActionableStep is a step that requires some action from one or more players. For example, at the beginning of the first night, the apprentice must wake up and decide to become a Grave Digger or a Priest.

Add ```include ActionableStep``` to your new step class. The ActionableStep module implements three required methods:

- options: an array of option objects which each have a value and label
- ask: the question or prompt
- action: a callback that is fired upon the response from the user

You can see the other methods available to implement by visiting classes/step/types/actionable_step.rb file. One commonly used method is parsed_response, which lets you parse the terminal response.

**Example: Apprentice Step**

```ruby
class ApprenticeStep < Step
  include ActionableStep

  private

    def options
      gravedigger = Gravedigger.new
      priest = Priest.new
      [
        Option.new(value: gravedigger.value, label: gravedigger.label),
        Option.new(value: priest.value, label: priest.label)
      ]
    end

    def parsed_response
      response.to_sym
    end

    def action
      player = game.find_players_by_character(:apprentice).first
      player.character = parsed_response.to_s.classify.constantize.new
    end

    def ask
      "Apprentice, wake up. Which do you want to become?"
    end

end
```

### StaticStep

Add ```include StaticStep``` to your new step class. The StaticStep module implements one required method:

- message

**Example: Static Step**

```ruby
class GravediggerStep < Step
  include StaticStep

  def message
    "Gravedigger, wake up. I will now point to the player that was last killed."
  end

end
```

### PlayerStep

The PlayerStep module allows you to pass :player_to_ask to the step.

Add ```include PlayerStep``` to your new step class.

**Example: Actionable and Player Step (note the player_to_ask variable is available in the ask method)**

```ruby
class DemonStep < Step
  include ActionableStep
  include PlayerStep

  def options
    options = game.surviving_good_players.map do |good_player|
      Option.new(value: good_player.id, label: good_player.name)
    end
    options
  end

  def action
    player = game.find_player_by_id(parsed_response)
    player.curse!
  end

  def ask
    "(you are talking to #{player_to_ask.name}): Demon, which player would you like to curse?"
  end

  def parsed_response
    response
  end
end
```