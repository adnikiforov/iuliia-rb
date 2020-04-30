# frozen_string_literal: true

require 'rspec'

describe Iuliia do
  describe '#translit' do
    let(:string) { 'whenever' }
    let(:schema) { Iuliia::Schema.available_schemas.sample[0] }

    it 'does call for translit' do
      expect_any_instance_of(Iuliia::Translit).to receive(:translit)

      described_class.translit(string, schema: schema)
    end
  end
end
