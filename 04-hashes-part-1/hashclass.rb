require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value) #defines = operator
    new_item = HashItem.new(key, value) #create new hash
    i = index(key, size) #create i var to store index

    if @items[i] === nil #if index === nil
      @items[i] = new_item #assign new item to index
    elsif @items[i].key != key #if key of index != key of new item
      self.resize #resize
      self[key] = value #pair value and key
    elsif (@items[i].key === key) && (@items[i].value != value) #if collision = true & values are different
      self.resize #resize
      @items[i] = value #pair key and value
    end
  end

  def [](key) #returns
    if @items[index(key, size)] != nil && @items[index(key, size)].key === key
      @items[index(key, size)].value
    end
  end

  def resize #double size of array
    old_array = @items
    @items = Array.new(old_array.length * 2)

    old_array.each do |item|
      unless item === nil #unless item is nil
        self[item.key] = item.value #assign value to key
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    result = 0
    key.each_byte do |letter| #converts characters to ascii values
      result += letter #adds ascii values to result
    end
    result % size #mod results
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
