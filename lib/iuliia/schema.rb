# frozen_string_literal: true

module Iuliia
  module Schema
    extend self

    SCHEMA = Struct.new(
      :description,
      :url,
      :mapping,
      :prev_mapping,
      :next_mapping,
      :ending_mapping
    )

    def schema(schema_name)
      schemas[schema_name]
    end

    def available_schemas
      schemas.map do |schema_name, schema|
        [schema_name, schema.description]
      end
    end

    private

    def schemas
      @schemas ||= load_schemas
    end

    def load_schemas
      Dir['lib/schemas/*.json'].map do |schema_file|
        file = File.read(schema_file)
        parse_and_create_schema(file)
      end.reduce({}, :update)
    end

    def parse_and_create_schema(file)
      parsed_data = JSON.parse(file)
      schema = SCHEMA.new(
        parsed_data['description'],
        parsed_data['url'],
        parsed_data['mapping'],
        parsed_data['prev_mapping'],
        parsed_data['next_mapping'],
        parsed_data['ending_mapping']
      )

      { parsed_data['name'] => schema }
    end
  end
end
