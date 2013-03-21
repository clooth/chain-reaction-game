# @codekit-prepend "util.coffee"
# @codekit-prepend "color.coffee"
# @codekit-prepend "ball.coffee"
# @codekit-prepend "level.coffee"
# @codekit-prepend "ui.coffee"

# Main game singleton class
class Game
  # instance is defined as null to force correct scope
  instance = null

  # Private class that we can initialize however defined
  # inside this scope to force the use of the singleton
  # class.
  class PrivateGame
    # Loading assets and required game data
    @STATE_LOADING = 1
    # Assets and game data has been loaded
    @STATE_LOADING_DONE = 2
    # Level selection screen
    @STATE_LEVEL_SELECTION = 3
    # Level has been selected
    @STATE_LEVEL_SELECTED = 4
    # Displays information about level
    # Note: index, ball count, required count
    @STATE_LEVEL_INFO = 5
    # Level information screen dismissed by clicking start
    @STATE_LEVEL_INFO_DISMISSED = 6
    # Level waiting for initial explosion
    @STATE_LEVEL_WAITING = 7
    # Initial explosion given, rendering results
    @STATE_LEVEL_STARTED = 8

    # Game canvas element
    canvas = null

    # Game canvas context (what we will be drawingo n)
    context = null

    # Game screen dimensions
    # Note: Calculated upon initialization and re-calculated
    #       when screen is resized.
    width = 0
    height = 0

    # Available levels
    levels = []

    # Current level index
    current_level = 0

    # Create a new game instance with given parameters
    constructor: (params) ->
      # Set up canvas
      @canvas = params.container
      @context = @canvas.getContext('2d')

    _bindEvents: () ->
      # Window resize event
      window.onresize = () =>
        @_handleResizeEvent()
      # Trigger initial resize event to set up game screen
      @_handleResizeEvent()

      # Bind mouse click events
      # TODO: Support touch events
      @canvas.onclick = (event) =>
        @_handleClickEvent.call(this, event)

    #
    # Event handlers
    #

    # Window resize event
    _handleResizeEvent: (event) ->
      # Get size by parent element
      @width = @canvas.parentNode.clientWidth
      @height = @canvas.parentNode.clientHeight

      # Resize canvas element itself
      @canvas.width = @width
      @canvas.height = @height

    # Mouse click event handler
    _handleClickEvent: (event) ->
      # Check state of

  # A static method used to either retrieve the instance
  # or create a new one.
  @get: (params) ->
    instance ?= new PrivateGame(params)
