require 'minitest'
require_relative 'node'
require 'pry'

class BinarySearchTree
  attr_reader :root, :current_node
  def initialize(key)
    @root = Node.new(key)
    @current_node = @root
  end

  def insert(key)
    if @current_node != nil
      case @current_node.key <=> key
      when -1
        if @current_node.right.nil?   #bigger key
          @current_node.right = Node.new(key)
        else
          @current_node.insert(key)
        end
      when 1                #smaller key
        if @current_node.left.nil?
          @current_node.left = Node.new(key)
        else
          @current_node.insert(key)
        end
      when 0
        if @tree.root.nil?
          @current_node = Node.new(key) && @tree.root == @current_node #first element
        else return @current_node #duplicate
        end
      end
    end
  end

  def test_nil()

  end

@tree = BinarySearchTree.new("p")
@tree.insert("c")
puts @tree.root.key
puts @tree.root.left.key
@tree.insert("z")
puts @tree.root.right.key
puts @tree.root.root?
end
