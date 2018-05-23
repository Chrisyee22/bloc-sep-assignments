require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root

  end

  def insert(root, node)
    if node.rating < root.rating #assuming root is present
      if root.left  === nil
        root.left = node
      else
        insert(root.left, node)
      end
    elsif node.rating > root.rating
      if root.right === nil
        root.right = node
      else
        insert(root.right, node)
      end
    end
  end

  # Recursive Depth First Search
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
      else find(root.left, data)

      end
    end
  end

  def delete(root, data)
    if data === nil
      return nil
    else node = find(root, data)
      if node === nil
        return nil
      else
        node.title =  nil
        node.rating = nil
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    array = [@root] #root is first item in array
    output = []
    while array.length > 0
      node = array.shift # returns first element and then removes it
      if node.left != nil  #content in left leaf of child
        array.push(node.left) #push left leaf to the array
        end
      if node.right != nil
        array.push(node.right)
      end
      output.push("#{node.title}: #{node.rating}")
    end
    output.each{|movie| puts movie}
  end
end
