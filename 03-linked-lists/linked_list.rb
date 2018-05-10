require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head === nil
      @head = node
      @tail = @head
      @tail.next = nil
    else
      current_node = @head
      while current_node.next != nil
        current_node = current_node.next
      end
      current_node.next = node
      @tail = current_node.next
      @tail.next = nil
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current_node = @head
    if @tail === nil
      return nil
    elsif @head === @tail
      @head = nil
      @tail = nil
    else
      while (current_node.next != @tail) && (current_node.next != nil)
        current_node = current_node.next
      end
      @tail = current_node
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head
    puts current_node.data
    while current_node.next != nil
      current_node = current_node.next
      puts current_node.data
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current_node = @head
    if @tail === nil
      return nil
    elsif @head === @tail
      @head = nil
      @tail = nil
    elsif @head === node
      @head = @head.next
    elsif @tail === node
      remove_tail
    else
      while (current_node.next != node) && (current_node.next != nil)
        current_node = current_node.next
      end
      current_node.next = current_node.next.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if (@head === nil) && (@tail === nil)
      @head = node
      @tail = node
    else
      temp_node = @head
      @head = node
      @head.next = temp_node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if(@head === nil) || (@head.next === nil) || (@head === @tail)
      @head = nil
    else
      @head = @head.next
    end
  end
end
