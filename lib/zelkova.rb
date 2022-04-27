# typed: strict
require "zelkova/version"
require "sorbet-runtime"
require "eikon"

require_relative "zelkova/graph"

module Zelkova
  class Error < StandardError; end
end
