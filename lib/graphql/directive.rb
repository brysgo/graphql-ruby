# This implementation of `Directive` is ... not robust.
# It seems like this area of the spec is still getting worked out, so
# {Directive} & {DirectiveChain} implement `@skip` and `@include` with
# minimal impact on query execution.
class GraphQL::Directive
  include GraphQL::Define::InstanceDefinable
  accepts_definitions :locations, :name, :description, :resolve, argument: GraphQL::Define::AssignArgument

  attr_accessor :locations, :arguments, :name, :description

  LOCATIONS = [
    QUERY =               :QUERY,
    MUTATION =            :MUTATION,
    SUBSCRIPTION =        :SUBSCRIPTION,
    FIELD =               :FIELD,
    FRAGMENT_DEFINITION = :FRAGMENT_DEFINITION,
    FRAGMENT_SPREAD =     :FRAGMENT_SPREAD,
    INLINE_FRAGMENT =     :INLINE_FRAGMENT,
  ]

  def initialize
    @arguments = {}
  end

  def resolve(arguments, proc)
    @resolve_proc.call(arguments, proc)
  end

  def resolve=(resolve_proc)
    @resolve_proc = resolve_proc
  end

  def to_s
    "<GraphQL::Directive #{name}>"
  end
end

require 'graphql/directive/include_directive'
require 'graphql/directive/skip_directive'
