class Level
  # Level index
  @index = 0

  # Amount of balls spawned to begin with
  balls_count = null

  # Amount of balls required to explode to succeed
  balls_required = null

  constructor: (@balls_count, @balls_required) ->
