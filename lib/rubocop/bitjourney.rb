require 'rubocop'

require 'rubocop/bitjourney/inject'
require 'rubocop/bitjourney/version'

RuboCop::BitJourney::Inject.defaults!

require 'rubocop/bitjourney/cop/rspec/is_expected_to'
