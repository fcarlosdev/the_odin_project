require './node.rb'

class BinaryTree

  attr_accessor :root

  def initialize(value=nil)
    @root = Node.new(value) if !value.nil?
  end

  def build_tree(array)
    @root = Node.new(array.shift)
    array.each {|value| insert(value,@root)}
  end

  def insert(value,current_node)
    value < current_node.value ? insert_left_node(value,current_node)
                               : insert_right_node(value,current_node)
  end

  def insert_left_node(value, current_node)
    if current_node.left_child.nil?
      current_node.left_child = Node.new(value,current_node)
    else
      insert_left_node(value,current_node.left_child)
    end
  end

  def insert_right_node(value,current_node)
    if current_node.right_child.nil?
      current_node.right_child = Node.new(value,current_node)
    else
      insert_right_node(value,current_node.right_child)
    end
  end

  def breadth_first_search(value)
    queue = [root]
    while !queue.empty?
      current_node = queue.shift
      return current_node if current_node.value.eql?value
      queue.push(current_node.left_child) if !current_node.left_child.nil?
      queue.push(current_node.right_child) if !current_node.right_child.nil?
    end
    nil
  end

  def depth_first_search(value)
    stack = [root]
    while !stack.empty?
      current_node = stack.pop
      return current_node if current_node.value.eql?value
      stack.push(current_node.right_child) if !current_node.right_child.nil?
      stack.push(current_node.left_child) if !current_node.left_child.nil?
    end
    nil
  end

  def dfs_rec(value, current_node=root)
    unless current_node.nil?
      return current_node if value == current_node.value
      return (value < current_node.value) ? dfs_rec(value,current_node.left_child)
                                          : dfs_rec(value,current_node.right_child)
    end
    return nil
  end

  #Traversal methods
  def in_order_traverse_tree(current_node)
    if !current_node.nil?
      in_order_traverse_tree(current_node.left_child)
      print "#{current_node.value} "
      in_order_traverse_tree(current_node.right_child)
    end
  end

  def pre_order_traverse_tree(current_node)
    if !current_node.nil?
      print "#{current_node.value} "
      pre_order_traverse_tree(current_node.left_child)
      pre_order_traverse_tree(current_node.right_child)
    end
  end

  def post_order_traverse_tree(current_node)
    if !current_node.nil?
      post_order_traverse_tree(current_node.left_child)
      post_order_traverse_tree(current_node.right_child)
      print "#{current_node.value} "
    end
  end

end

array_of_data = [40, 25, 78, 10, 32, 80]
btree = BinaryTree.new
btree.build_tree(array_of_data)
node = btree.breadth_first_search(32)
puts (node.nil?) ? "Node not found.": "Node #{node.value} is down of node #{node.parent.value}" if node != btree.root
puts (node.nil?) ? "Node not found.": "Node #{node.value} is root." if node.eql?btree.root
node = btree.depth_first_search(80)
puts (node.nil?) ? "Node not found.": "Node #{node.value} is down of node #{node.parent.value}" if node != btree.root
puts (node.nil?) ? "Node not found.": "Node #{node.value} is root." if node.eql?btree.root
node = btree.dfs_rec(10)
puts (node.nil?) ? "Node not found.": "Node #{node.value} is down of node #{node.parent.value}" if node != btree.root
puts (node.nil?) ? "Node not found.": "Node #{node.value} is the root." if node.eql?btree.root

puts "*********************************************"
puts "| Traversing Binary Search Inorder Traversal|"
puts "*********************************************"
puts "#{btree.in_order_traverse_tree(btree.root)}"

puts "**********************************************"
puts "| Traversing Binary Search Preorder Traversal|"
puts "**********************************************"
puts "#{btree.pre_order_traverse_tree(btree.root)}"

puts "**********************************************"
puts "| Traversing Binary Search Preorder Traversal|"
puts "**********************************************"
puts "#{btree.post_order_traverse_tree(btree.root)}"
