# typed: ignore
require "test_helper"

class ZelkovaTest < Minitest::Test
  def test_that_it_has_a_version_number
    assert_not_nil ::Zelkova::VERSION
  end

  def test_that_we_can_create_a_search_tree
    assert_not_nil(Zelkova.graph)
    assert Zelkova.graph.class == Zelkova::Graph
  end

  def test_that_we_can_create_a_node
    graph = Zelkova::Graph.new

    node = graph.add_node("testword")
    assert_not_nil node
    assert_equal node.word, "testword"
  end

  def test_that_we_can_create_two_nodes_with_edge
    graph = Zelkova::Graph.new

    graph.add_node("testword")
    graph.add_node("secondword")

    assert_not graph.root_node.edges.empty?
    assert_equal graph.root_node.edges.first.end_node.word, "secondword"
    assert_equal graph.root_node.edges.first.weight, 9
  end
end
