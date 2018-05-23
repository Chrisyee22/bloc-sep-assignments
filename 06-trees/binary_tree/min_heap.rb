require_relative 'node'

class MinHeapTree

  def initialize(root)
    @root = root
  end

  puts "insert"
  def insert(root, node)
    puts root.title
    if node.rating < root.rating
      temp = root
      root = node
      puts root.title
      puts "Node with value #{temp.rating} is being replaced with #{node.rating}"
      if root.left === nil
        puts temp.title
        puts temp.rating
        root.left = temp
      elsif root.right === nil
        root.right = temp
      else
        insert(root.left, temp) #insert temp in left subtree as left leaf
      end
    else node.rating > root.rating
      if root.left ===  nil
        root.left = node
      elsif root.right === nil
        root.right = node
      else
        insert(root.left, node)
      end
    end
  end

  def find(root, data)
    if data === nil
      return nil
    elsif root.title === data
      return root
    elsif root.title != data && root.left === nil
      if root.right === data
        return root.right
      elsif root.right === nil
        return nil
      else
        find(root.right, data)
      end
    elsif root.title != data && root.left != nil
      if root.left === data
        return root.left
      else
        find(root.left, data)
      end
    end
  end

  def delete(root, data)
  end

  def print(root)
  end

end
