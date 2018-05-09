class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    self.top = item
    @stack.push(item)
  end

  def pop
    removePerson = @stack.delete_at(-1)
    self.top = @stack[-1]
    return removePerson

  end

  def empty?
    if @stack.length === 0
      return true
    else
      return false
    end
  end
end
