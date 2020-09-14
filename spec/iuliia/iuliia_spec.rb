# frozen_string_literal: true

require 'rspec'

describe Iuliia do
  describe '#translit' do
    let(:string) { 'whenever' }
    let(:schema) { Iuliia::Schema.available_schemas.sample[0] }

    context 'with existing schema' do
      before do
        expect_any_instance_of(Iuliia::Translit).to receive(:translit)
      end

      it 'does call for translit' do
        described_class.translit(string, schema: schema)
      end
    end

    context 'without existing schema' do
      let(:schema) { :non_existent_schema }

      before do
        expect_any_instance_of(Iuliia::Translit).to receive(:translit).and_return nil
      end

      it 'does not call for translit' do
        described_class.translit(string, schema: schema)
      end
    end
  end
end
