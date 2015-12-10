require 'minitest/autorun'
require 'binary_search_tree'
require 'node'
require 'pry'

class BinarySearchTreeTest < Minitest::Test
  def setup
    @tree = BinarySearchTree.new("c")
  end
end

  class InitBinarySearchTreeTest < BinarySearchTreeTest
    def test_initializing_tree_creates_new_tree
      assert_instance_of BinarySearchTree, @tree
    end

    def test_initializing_tree_creates_a_root
      assert_equal "c", @tree.root.key
    end
  end

  class InsertInTreeTest < BinarySearchTreeTest
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

    def test_when_inserting_multiple_elements_middle_element_has_no_nil_branches
      @tree.insert("m")
      @tree.insert("q")
      @tree.insert("l")
      assert @tree.root.right.left != nil
      assert @tree.root.right.right != nil
    end

    def test_inserting_duplicate_elements_retains_tree_structure
      @tree.insert("m")
      insert1 = [@tree.root.right.right, @tree.root.right.left, @tree.root.right.key]
      @tree.insert("m")
      insert2 = [@tree.root.right.right, @tree.root.right.left, @tree.root.right.key]
      assert_equal insert1, insert2
    end
  end

class FindInTreeTest < BinarySearchTreeTest

  def test_include_returns_true_for_an_existing_node
    @tree.insert("m")
    assert_equal true, @tree.include?("m")
  end

  def test_include_returns_false_for_a_value_not_in_tree
    @tree.insert("m")
    assert_equal false, @tree.include?("b")
  end

  def test_max_returns_max_value_with_several_insertions
    @tree.insert("a")
    @tree.insert("q")
    @tree.insert("l")
    @tree.insert("t")
    @tree.insert("o")
    assert_equal "t", @tree.max
  end

  def test_min_returns_max_value_with_several_insertions
    @tree.insert("a")
    @tree.insert("q")
    @tree.insert("l")
    @tree.insert("t")
    @tree.insert("o")
    assert_equal "a", @tree.min
  end

  def test_tree_with_root_as_leaf_is_both_max_and_min
    assert_equal "c", @tree.max
    assert_equal "c", @tree.min
  end
end

class SortTheTreeTest < BinarySearchTreeTest
  def test_if_the_traversed_array_is_empty_traverse_creates_new_one
    @tree.traverse_tree

    assert_equal ["c"], @tree.root.key_array
  end
end
