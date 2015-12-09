include 'minitest'

class EmptyNode
  attr_reader

  def initialize
    @left = EmptyNode.new(*)
    @right = EmptyNode.new(*)
  end






end
