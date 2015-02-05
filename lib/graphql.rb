require "parslet"
require "active_support/core_ext/string/inflections"
require "active_support/core_ext/object/blank"

module GraphQL
  VERSION = "0.0.1"

  autoload(:CollectionEdge,   "graphql/collection_edge")
  autoload(:Parser,           "graphql/parser")
  autoload(:Query,            "graphql/query")
  autoload(:Node,             "graphql/node")
  autoload(:Transform,        "graphql/transform")

  module Syntax
    autoload(:Call,       "graphql/syntax/call")
    autoload(:Edge,       "graphql/syntax/edge")
    autoload(:Field,      "graphql/syntax/field")
    autoload(:Node,       "graphql/syntax/node")
  end

  PARSER = Parser.new
  TRANSFORM = Transform.new

  class FieldNotDefinedError < RuntimeError
  end
end