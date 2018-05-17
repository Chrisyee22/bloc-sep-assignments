require_relative 'node'

class OpenAddressing
  def initialize(size)
  @items = Array.new(size)
  end

  def []=(key, value)
    new_item = Node.new(key, value) #create new hash
    i = index(key, size) #create variable to store the index

    if @items[i] === nil  #for nil = index
       @items[i] = new_item #return the new item
    elsif @items[i].key != key #else key of index != key of the new item
       self.resize #resize
       self[key]= value #pair value and key
    elsif (@items[i].key === key) && (@items[i].value != value)#elsif item key = key and item value != value
      if self.next_open_index(@items[i] === -1) #move to next index location
        self.resize
        @items[i] = value
      else self.next_open_index(@items[i] != -1)
        @items[i] = value
      end
    end
  end

  def [](key)
    if @items[index(key, size)] != nil && @items[index(key, size)].key === key
      @items[index(key, size)].value
    end
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

  # Given an index, find the next open index in @items
  def next_open_index(index)
    @items.each do |item|
      if item === nil
        return index
      else
        return -1
      end
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)

    old_array.each do |item|
      unless item === nil
        self[item.key] = item.value
      end
    end
  end
end
