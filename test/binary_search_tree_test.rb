require 'minitest/autorun'
require 'binary_search_tree'
require 'node'
require 'pry'

class BinarySearchTreeTest < Minitest::Test

  def setup
    @tree = BinarySearchTree.new("c")

  end

  def test_initializing_tree_creates_new_tree
    assert_instance_of BinarySearchTree, @tree
  end

  def test_initializing_tree_creates_a_root
    assert_equal true, @tree.root.root?
  end

  def test_inserted_2nd_element_is_right_of_first
    @tree.insert("m")
    assert_equal "m", @tree.root.right.key
  end

  def test_inserting_multiple_elements_orders_correctly
    @tree.insert("m")
    @tree.insert("q")
    @tree.insert("a")
    assert_equal "q", @tree.root.right.right.key
  end

  def test_inserting_multiple_elements_middle_element_has_no_nil_branches
    @tree.insert("m")
    @tree.insert("q")
    @tree.insert("l")
    assert @tree.root.right.left !== nil && @tree.root.right.right !== nil
  end
end
