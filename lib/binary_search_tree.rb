require 'minitest'
require_relative 'node'
require 'pry'


class BinarySearchTree
  include Enumerable

  attr_reader :root

  def initialize(key)
    @root = Node.new(key)
  end

  def traverse_tree
    if @root
      @root.process_node
    end
  end

  def sort
    if @root.key_array.empty?
      traverse_tree
    end
    @root.key_array
  end

  # logic is off on capturing depth, have to refactor how it's used
  def depth_of(k)
    if @root.key_array.empty?
      traverse_tree
    end
    @root.key_array.detect do | pair |
      pair.first == k
    end.last
  end

  def insert(key)
    node = @root
    while node
      case key <=> node.key
      when 1
        if node.right.nil? #bigger key
          node.right = Node.new(key)
        else
          node = node.right
        end
      when -1               #smaller key
        if node.left.nil?
          node.left = Node.new(key)
        else
          node = node.left
        end
      when 0
        return    #duplicate key, ignore
      end
    end
  end

  def max
    node = @root
    while node.right
      node = node.right
    end
    return node.key
  end

  def min
    node = @root
    while node.left
      node = node.left
    end
    return node.key
  end

  def min_with_sort
    if @root.key_array.empty?
      traverse_tree
    end
    @root.key_array[0]
  end

  def max_with_sort
    if @root.key_array.empty?
      traverse_tree
    end
    @root.key_array[-1]
  end

  def include?(k)
    if @root.key_array.empty?
      traverse_tree
    end
    value = @root.key_array.detect {|i| k == i}
    !!value
  end         # I knew I could use Array.include? but that
              # felt like cheating & I could try out another
              #enumerable

end
