# frozen_string_literal: true

require 'rspec'

describe Iuliia::Schema do
  describe '#[]' do
    subject { Iuliia::Schema[schema.to_sym] }

    context 'with existing schema' do
      let(:schema) { Iuliia::Schema.available_schemas.sample[0].to_sym }

      it 'opens the schema' do
        expect(subject.class).to eq(OpenStruct)
      end
    end

    context 'without existing schema' do
      let(:schema) { :non_existent_schema }
      let(:error) { Iuliia::Exceptions::NonExistentSchemaException }
      let(:error_message) { 'Specified schema does not exist' }

      it 'responds with nil' do
        expect { subject }.to raise_error(error, error_message)
      end
    end
  end
end
