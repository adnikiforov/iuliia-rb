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
      let(:error) { Iuliia::Exceptions::NonExistentSchemaException }
      let(:error_message) { 'Specified schema does not exist' }

      it 'raises Exceptions::NonExistentSchemaException' do
        expect { described_class.translit(string, schema: schema) }.to raise_error(error, error_message)
      end
    end
  end
end
