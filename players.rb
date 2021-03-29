
class Players

  attr_reader :name, :health

  def initialize(name) # initialize the player with their name and health
    @name = name
    @health = 5
  end

  def lose_health #set the lose health method to -1 for a wrong answer
    @health -= 1
  end
end