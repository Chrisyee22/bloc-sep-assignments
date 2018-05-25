require_relative 'node'

class MinHeap
  def initialize(root)
    @root = root
  end

  def insert(root, node)
    current_node = root
    parent_node = insert_heap(current_node, node)
    while parent_node.rating > node.rating
      node = swap(parent_node, node)
      parent_node = node.parent
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    current_node = root
    if data == nil
      return nil
    end
    if current_node.title == data
      return current_node
    end

		if current_node.left
			left = find(current_node.left, data)
		end

		if current_node.right
			right = find(current_node.right, data)
		end
		left || right
  end

  def delete(root, data)
    if data == nil
      return nil
    end
    current_node = root
    node_delete = find(current_node, data)
    node_previous = node_delete.parent
    if node_previous.left == node_delete
      node_previous.left = nil
    elsif node_previous.right == node_delete
      node_previous.right = nil
    end
  end

  def printf(children=nil)
    queue = []
    queue.push(@root)
    while queue.size != 0
      node = queue.shift
      puts "#{node.title}: #{node.rating}"
      node.children.each {|child| queue.push(child)}
    end
  end



  def insert_heap(current_node, new_node)
    if current_node.left.nil?
      current_node.left = new_node
      new_node.parent = current_node
      return current_node
    elsif current_node.right.nil?
      current_node.right = new_node
      new_node.parent = current_node
      return current_node
    else
      queue = []
      queue.push(current_node)
      while queue.size != 0
        node = queue.shift
        if node.left.left.nil? || node.left.right.nil?
          return insert_heap(node.left, new_node)
        elsif node.right.left.nil? || node.right.right.nil?
          return insert_heap(node.right, new_node)
        else
          node.children.each {|child| queue.push(child) }
        end
      end
    end
  end

  def swap(parent_node, child_node)
    temp_l = child_node.left
    temp_r = child_node.right

    if parent_node.left == child_node
        child_node.left = parent_node
        if parent_node.right
          child_node.right = parent_node.right
          child_node.right.parent = child_node
        end
    else
        child_node.left = parent_node
        child_node.right = parent_node.left
        parent_node.left.parent = child_node
    end
    child_node.parent = parent_node.parent
    if child_node.parent.left == parent_node
      child_node.parent.left = child_node
    else
      child_node.parent.right = child_node
    end
    parent_node.parent = child_node
    parent_node.left = temp_l
    parent_node.right = temp_r
    return child_node
  end
end
