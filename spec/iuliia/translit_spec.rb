# frozen_string_literal: true

require 'rspec'

describe Iuliia::Translit do
  describe '#translit' do
    let(:test_data) do
      Dir['lib/schemas/*.json'].map do |schema_file|
        file = File.read(schema_file)
        data = JSON.parse(file)
        schema_name = data['name']
        samples = data['samples']

        { schema_name => samples }
      end.reduce({}, :update)
    end

    it 'transliterates strings correctly' do
      test_data.each do |schema_name, samples|
        pp "Schema #{schema_name}"

        samples.each do |sample|
          expect(described_class.new(sample[0], schema_name).translit).to eq(sample[1])
        end
      end
    end

    context 'with latin chars' do
      let(:schema) { 'telegram' }
      let(:given) { 'Юлия, съешь ещё этих soft french булок из Vancouver City, да выпей алтайского TEA' }
      let(:expected) { 'Iuliia, sesh esce etih soft french bulok iz Vancouver City, da vypei altaiskogo TEA' }

      it 'transliterates strings correctly' do
        expect(described_class.new(given, schema).translit).to eq(expected)
      end
    end
  end
end
