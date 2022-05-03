# typed: ignore
require "test_helper"
require "json"

class GraphTest < Minitest::Test
  def test_that_we_can_create_a_graph
    graph = Zelkova::Graph.new
    assert_not_nil graph
  end

  def test_that_we_can_rest_a_graph
    graph = Zelkova::Graph.new

    graph.add_node("testword")
    graph.add_node("secondword")

    graph.reset

    assert graph.nodes.count.zero?
  end

  def test_that_we_can_build_a_graph
    graph = Zelkova::Graph.new

    file = File.open("./test/wordlist.json")
    file_data = file.read

    word_list = JSON.parse(file_data)

    word_list.each do |word|
      graph.add_node(word)
    end

    assert_equal graph.nodes.count, word_list.count
  end

  def test_we_store_the_depth_of_the_graph
    graph = Zelkova::Graph.new

    file = File.open("./test/wordlist.json")
    file_data = file.read

    word_list = JSON.parse(file_data)

    word_list.each do |word|
      graph.add_node(word)
    end

    assert graph.depth.positive?
  end

  def test_searching
    # This one takes awhile because we build a VERY big data structure
    graph = Zelkova::Graph.new

    file = File.open("./test/word_list.json")
    file_data = file.read

    word_list = JSON.parse(file_data)

    word_list.each do |word|
      graph.add_node(word)
    end

    results = graph.search("tes")

    assert_not results.empty?
  end
end
