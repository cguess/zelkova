# typed: strict

require "sorbet-runtime"

class Zelkova::Edge
  extend T::Sig

  sig { returns(Zelkova::Node) }
  attr_reader :start_node
  sig { returns(Zelkova::Node) }
  attr_reader :end_node
  sig { returns(Integer) }
  attr_reader :weight

  sig { params(start_node: Zelkova::Node, end_node: Zelkova::Node, weight: Integer).void }
  def initialize(start_node, end_node, weight)
    @start_node = T.let(start_node, Zelkova::Node)
    @end_node = T.let(end_node, Zelkova::Node)
    @weight = T.let(weight, Integer)
  end

  sig { returns(String) }
  def inspect
    "Start Word: #{self.start_node.word}, End Word: #{self.end_node.word}, Weight: #{weight}"
  end
end
