require 'spec_helper'

describe RuboCop::Cop::RSpec::IsExpectedTo do
  subject(:cop) { described_class.new }

  shared_examples_for 'preferring is_expected.to' do
    it 'prefers using is_expected.to to should' do
      inspect_source(cop, code)
      expect(cop.offenses.size).to eq(1)
      expect(cop.messages).to eq ['Prefer `is_expected.to` to `should`.']
    end
  end

  context 'with one liner' do
    let(:code) { 'it { should be_valid }' }

    it_behaves_like 'preferring is_expected.to'
  end

  context 'with multiple lines' do
    let(:code) do
      <<-EOS
it '' do
  should be_valid
end
      EOS
    end

    it_behaves_like 'preferring is_expected.to'
  end
end
