require 'minitest'

class Node
  attr_reader :key
  attr_accessor :right, :left

  def initialize(k)
    @key = k
    @left = nil
    @right = nil
    @@key_array = []

  end

  def key_array
    @@key_array
  end

  def leaf?
  end

  def process_node
    if @left
      @left.process_node
    end
      @@key_array << @key
    if @right
      @right.process_node
    end
  end

  # for include later
  def search_in(k)
    node = @root
    while node
      if node.key == k
        return node
      elsif node.nil?
        return
      # binding.pry
      elsif k < node.key
        search_for(node.left, k)
      else # (k > node.key)
        search_for(node.right, k)
      end
    end
  end

end
