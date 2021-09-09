class OccupiedError < StandardError
  def initialize(msg = "Occupied by an ally ! That's illegal for you to move there !!")
    super msg
  end
end