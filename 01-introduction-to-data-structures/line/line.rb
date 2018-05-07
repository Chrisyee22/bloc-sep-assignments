# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
12
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members.push(person)
  end

  def leave(person)
    self.members.delete(person)
  end

  def front
    self.members.first
  end

  def middle
    midpoint = (self.members.length/2).ceil
    self.members[midpoint]
  end

  def back
    self.members.last
  end

  def search(person)
    if index(person)
      person
    end
  end

  private

  def index(person)
    self.members.find_index(person)
  end

end
