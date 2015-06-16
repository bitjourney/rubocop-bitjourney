module RuboCop
  module Cop
    module RSpec
      # This cop is used to identify usages of `should`
      #
      # @example
      #   # bad
      #   it { should be_valid }
      #
      #   # good
      #   it { is_expected.to be_valid }
      class IsExpectedTo < Cop
        MSG = 'Prefer `is_expected.to` to `should`.'

        def on_block(node)
          _method, _args, body = *node
          _receiver, property_name, *_args = *body
          return unless property_name == :should

          expr = body.loc.expression
          bp = expr.begin_pos
          ep = expr.end_pos
          range = Parser::Source::Range.new(expr.source_buffer, bp, ep)
          add_offense(node, range, MSG)
        end
      end
    end
  end
end
