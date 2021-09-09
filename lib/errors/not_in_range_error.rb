class NotInRangeError < StandardError
  def initialize(msg = "This is not in range ! That's illegal for you to move there !!")
    super msg
  end
end