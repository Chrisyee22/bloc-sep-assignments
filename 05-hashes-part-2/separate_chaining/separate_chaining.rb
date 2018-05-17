require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor
  attr_reader :count

  def initialize(size)
    @items = Array.new(size)
    @max_load_factor = 0.7
  end

  def []=(key, value)
    new_item =  Node.new(key, value)
    i = index(key, self.size)

    if @items[i] === nil
      list = LinkedList.new
      list.add_to_tail(new_item)
      @items[i] = list
    elsif @items[i].size < 5
      if self[key] != value
        @items[i].add_to_tail(new_item)
      end
    else
      if self[key] != value
        self.resize
        self[key] = value
      end
    end
    if self.load_factor >= @max_load_factor
      self.resize
    end
  end

  def [](key)
    i = index(key, self.size)
    if @items[i] != nil
      item = @items[i].find_node(key)
      if item != nil
        if item.value != nil
          return item.value
        end
      end
    end
    return nil
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    result = 0
    key.each_byte do |letter|
      result += letter
    end
    result % size
  end

  # Calculate the current load factor
  def load_factor
    count = 0.0
      @items.each do |list|
        if list != nil
          puts list
          count += list.size
          puts count
        end
      end
    count / size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)

    old_array.each do |list|
      if list != nil
        current = list.head
        if current != list.tail
          self[current.key] = current.value
          current = current.next
        elsif current === list.tail
          self[current.key] = current.value
        end
      end
    end
  end
end
