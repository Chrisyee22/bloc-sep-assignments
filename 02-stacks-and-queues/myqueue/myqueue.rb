class MyQueue
  attr_accessor :head
  attr_accessor :tail
  attr_accessor :queue

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    @queue.push(element)
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    removePerson = @queue.delete_at(0)
    return removePerson
  end

  def empty?
    if @queue.length === 0
      return true
    else
      return false
    end
  end
end
