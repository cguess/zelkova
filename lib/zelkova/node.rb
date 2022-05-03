# typed: strict

require "sorbet-runtime"

class Zelkova::Node
  extend T::Sig

  sig { returns(String) }
  attr_reader :word
  sig { returns(T::Array[Zelkova::Edge]) }
  attr_reader :edges
  sig { returns(Zelkova::Graph) }
  attr_reader :graph
  sig { returns(T::Hash[T.untyped, T.untyped]) }
  attr_reader :metadata

  sig { params(word: String, graph: Zelkova::Graph, metadata: T.nilable(T::Hash[T.untyped, T.untyped])).void }
  def initialize(word, graph, metadata = {})
    @word = T.let(word, String)
    @graph = T.let(graph, Zelkova::Graph)
    @edges = T.let([], T::Array[Zelkova::Edge])
    @metadata = T.let(T.must(metadata), T::Hash[T.untyped, T.untyped])
  end

  sig { returns(String) }
  def inspect
    "Word: #{self.word}, Number of Edges: #{self.edges.count}, Metadata: #{self.metadata}"
  end

  sig { params(node: Zelkova::Node, weight: Integer).void }
  def add_edge(node, weight)
    @edges << Zelkova::Edge.new(self, node, weight)
  end
end
