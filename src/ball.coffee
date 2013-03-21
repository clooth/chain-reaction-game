#
# Game Ball Class
# Represents every ball on the screen
#
class Ball
  # Moving freely around the game screen
  @STATE_MOVING = 1

  # Expanding to full size after collision
  @STATE_EXPANDING = 2

  # Shrinking into oblivion after lifetime has ended
  @STATE_SHRINKING = 4

  # Ball has reached its maximum size and is waiting to be cleared
  @STATE_EXPANDED = 8

  constructor: (@radius) ->
    # Set the ball position to a random location on the screen
    @x = randomInt(@radius, )



class Ball
  # Possible ball states
  @STATE_MOVING = 1
  @STATE_COLLIDED = 2
  @STATE_COLLIDED_EXPANDING = 4
  @STATE_COLLIDED_SHRINKING = 8

  # Ball lifetime
  @LIFETIME = 100

  x: null
  y: null

  dx: null
  dy: null

  color: null
  state: null
  lifetime: null

  # Creates a new randomly positioned/colored ball
  constructor: (@radius, gameWidth, gameHeight) ->
    # Position of the ball
    @x = Util.randomInt(@radius, gameWidth - @radius)
    @y = Util.randomInt(@radius, gameHeight - @radius)

    # Movement delta values
    dirX = if Util.randomInt(0, 1) is 1 then 1 else -1
    dirY = if Util.randomInt(0, 1) is 1 then 1 else -1
    @dx = (Util.randomInt(7, 17) / 10.0) * dirX
    @dy = (Util.randomInt(7, 17) / 10.0) * dirY

    # Ball color
    @color = Util.randomHexColor()

    # Start moving
    @state = Ball.STATE_MOVING

    # Lifetime
    @lifetime = Ball.LIFETIME