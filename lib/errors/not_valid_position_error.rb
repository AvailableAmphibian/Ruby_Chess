class NotValidPositionError < StandardError
  def initialize(msg = "This is not a valid position for you !!")
    super msg
  end
end