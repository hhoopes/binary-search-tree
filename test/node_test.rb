require 'minitest'
require 'list'
require 'head'

class NodeTest < Minitest::Test
  def setup
    @list = List.new
    @node = Node.new("k")
  end

  def test_can_create_instance
    assert_instance_of Node, @node
  end

  def test_single_node_has_root
    assert_equal Node.key, @node.key
  end

  def test_left_and_right_are_nil_with_one_node
    assert_nil @node.right && @node.left
  end
