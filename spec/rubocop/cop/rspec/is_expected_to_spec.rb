require 'spec_helper'
require 'pry'

describe RuboCop::Cop::RSpec::IsExpectedTo do
  subject(:cop) { described_class.new }

  it 'prefers using is_expected.to to should' do
    inspect_source(cop, 'it { should be_valid }')
    expect(cop.offenses.size).to eq(1)
    expect(cop.messages).to eq ['Prefer `is_expected.to` to `should`.']
  end
end
