require 'minitest'

class Node
  attr_reader :element, :key
  attr_accessor :right, :left
  def initialize(k)
    @key = k
    @left = nil
    @right = nil
    # @parent = parent
  end

  def root?
    @left == nil && @right == nil
  end

end
