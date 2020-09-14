# frozen_string_literal: true

require 'rspec'

describe Iuliia do
  describe 'Schema loading' do
    describe '#opening' do
      subject { Iuliia::Schema[schema.to_sym] }

      context 'with existing schema' do
        let(:schema) { Iuliia::Schema.available_schemas.sample[0].to_sym }

        it 'opens the schema' do
          expect(subject.class).to eq(OpenStruct)
        end
      end

      context 'without existing schema' do
        let(:schema) { :non_existent_schema }

        it 'responds with nil' do
          expect(subject).to be_nil
        end
      end
    end
  end
end
