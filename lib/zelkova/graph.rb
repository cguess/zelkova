# typed: strict
#
require "sorbet-runtime"
require "eikon"

require_relative "node"
require_relative "edge"

class Zelkova::Graph
  extend T::Sig

  sig { returns(T.nilable(Zelkova::Node)) }
  attr_reader :root_node

  sig { returns(T::Array[Zelkova::Node]) }
  attr_reader :nodes

  sig { returns(Integer) }
  attr_reader :depth

  sig { void }
  def initialize
    @root_node = T.let(nil, T.nilable(Zelkova::Node))
    @nodes = T.let([], T::Array[Zelkova::Node])
    @depth = T.let(0, Integer)
  end

  sig { params(word: String, metadata: T.nilable(T::Hash[T.untyped, T.untyped])).returns(Zelkova::Node) }
  def add_node(word, metadata = {})
    node = Zelkova::Node.new(word, self, metadata)
    nodes << node

    if @root_node.nil?
      @root_node = node
      @depth = 1
      return node
    end

    current_node = T.let(@root_node, Zelkova::Node)
    node_depth = 1

    loop do
      distance = Eikon::Comparator.compare(current_node.word, word)
      break if distance.zero? # don't add if it's already in the graph

      edge = current_node.edges.select { |edge| edge.weight == distance }

      unless edge.empty?
        current_node = T.must(edge.first).end_node
        node_depth += 1
        next
      end

      current_node.add_edge(node, distance)
      break
    end

    @depth = node_depth if node_depth > @depth

    node
  end

  sig { params(query: String).returns(T::Array[String]) }
  def search(query)
    radius = 2
    candidate_nodes = []
    candidate_edges = []

    # just so we can start this out
    candidate_edges << Zelkova::Edge.new(T.must(@root_node), T.must(@root_node), 0)

    loop do
      node = candidate_edges.pop.end_node

      distance = Eikon::Comparator.compare(query, node.word)
      candidate_nodes << { node: node, distance: distance } if distance <= radius

      node.edges.each do |edge|
        if edge.weight > (distance - radius) || edge.weight < (distance + radius)
          candidate_edges << edge
        end
      end

      break if candidate_edges.empty?
    end

    candidate_nodes.sort_by! { |candidate_node| candidate_node[:distance] }
    candidate_nodes.map { |candidate_node| candidate_node[:node].word }
  end
end

# class Comparator
#   extend T::Sig

#   sig { params(dhash_1: String, dhash_2: String).returns(Integer) }
#   def self.compare(dhash_1, dhash_2)
#     hamming_distance = 0
#     dhash_1.chars.each_with_index do |character, index|
#       hamming_distance += 1 if character != dhash_2.chars[index]
#     end

#     hamming_distance + (dhash_1.length - dhash_2.length).abs
#   end
# end
