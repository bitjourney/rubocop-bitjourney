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
          if property_name == :should
            add_offense(node, :expression, MSG)
          end
        end
      end
    end
  end
end
