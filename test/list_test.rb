require 'minitest'
require 'list'
require 'head'

class ListTest < Minitest::Test
  def setup
    @list = List.new


  end

  def test_can_create_instance
    assert_instance_of List, @list
  end

  def test_returns_nil_for_root_if_no_nodes
    assert_nil @list.root
  end

  def test_returns_a_pointer_to_a_root_when_node_is_created
    @node_1 = Node.new("a")
    assert_equal List.root, @node1
  end

  def test_returns_nil_when_the_last_node_is_destroyed
    @node1.delete_node
    assert_nil @list.root
  end

end
