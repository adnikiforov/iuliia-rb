# frozen_string_literal: true

module Iuliia
  module Schema
    class << self
      # Fetch schema by schema name
      # @param schema_name [String]
      # @return [Iuliia::Schema]
      def [](schema_name)
        schemas[schema_name]
      end

      # @deprecated
      alias schema []

      # Return list of available schemas
      # @return [Array]
      def available_schemas
        load_schemas.transform_values(&:description).to_a
      end

      private

      def schemas
        @schemas ||= Hash.new { |h, k| h[k] = load_schema(k) }
      end

      def load_schema(name)
        JSON.parse(File.read("lib/schemas/#{name}.json"), object_class: OpenStruct, symbolize_names: true)
      rescue Errno::ENOENT => e
        puts "Failed to load schema. #{e.message}"
      end

      def load_schemas
        Dir['lib/schemas/*.json'].map do |file|
          schema = load_schema(File.basename(file, '.json'))
          [schema.name, schema]
        end.to_h
      end
    end
  end
end
