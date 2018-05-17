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
      current = @head
      while current.next != nil
        current = current.next
      end
      current.next = node
      @tail = current.next
      @tail.next =  nil
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current = @head
    if @tail === nil
      return nil
    elsif @head === @tail
      @head = nil
      @tail = nil
    elsif
      while (current.next != nil) && (current.next != @tail)
        current = current.next
      end
      @tail = current.next
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    current = @head
    while current.next != nil
      current = current.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current = @head
    if @tail ===nil
      return nil
    elsif @head === @tail
      @head = nil
      @tail = nil
    elsif @head === node
      @head = @head.next
    elsif @tail === node
      remove_tail
    else
      while (current.next != nil ) && (current.next != node)
        current = current.next
      end
    current.next = current.next.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if (@head === nil) && (@tail === nil)
      @head = node
      @tail = node
    else
      temp_node = @head #stores head in temp variable
      @head = node
      @head.next = temp_node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if (@head === nil) || (@head.next === nil) || (@head === @tail)
      @head = nil
    else
      @head = @head.next
    end
  end

  def find_node(key)
    current = @head
    while current != nil && current.key != key
      current = current.next
    end
    current
 end

  def size
    i = 1
    if @head != nil
      current = @head
      while current != @tail
        current = current.next
        i += 1
      end
    end
    return i
  end
end
