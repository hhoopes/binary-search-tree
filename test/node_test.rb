require 'minitest/autorun'
require 'node'
require 'binary_search_tree'
require 'pry'

class NodeTest < Minitest::Test
  def setup
    @node = Node.new("k")
  end

  def test_can_create_instance
    assert_instance_of Node, @node
  end

  def test_initialized_node_has_a_key
    assert_equal "k", @node.key
  end

  def test_left_and_right_are_nil_with_one_node
    assert_nil @node.right && @node.left
  end
end
