# typed: strict
require "zelkova/version"
require "sorbet-runtime"
require "eikon"

require_relative "zelkova/graph"

module Zelkova
  class Error < StandardError; end

  @@graph = T.let(Zelkova::Graph.new, Zelkova::Graph)

  class << self
    extend T::Sig

    sig { returns(Zelkova::Graph) }
    def graph
      # TODO: make this lazy when in development mode for speed
      @@graph
    end
  end
end
