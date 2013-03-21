# Main game UI (overlayed on top of everything else)
class UI

  # Represents a single screen in the game
  class Screen
    # Name of this screen, so it can be referenced from game
    name: null

    # Components displayed on this screen
    components: []

    constructor: (@params) ->
      @components = @params.components
      @name = @params.name

  class WelcomeScreen extends Screen

  class SelectLevelScreen extends Screen

  class StartLevelScreen extends Screen

  class PlayLevelScreen extends Screen

  class GameOverScreen extends Screen

  class LevelClearScreen extends Screen