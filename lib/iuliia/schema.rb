# frozen_string_literal: true

module Iuliia
  module Schema
    class << self

      # Fetch schema by schema name
      # @param schema_name [String]
      # @return [Iuliia::Schema]
      def [](schema_name)
        warn "[DEPRECATION] Gem has been renamed to 'iuliia'. Please, use 'iuliia' instead."

        schemas[schema_name]
      end

      alias schema []

      # Return list of available schemas
      # @return [Array<Iuliia::Schema]>]
      def available_schemas
        warn "[DEPRECATION] Gem has been renamed to 'iuliia'. Please, use 'iuliia' instead."

        load_schemas.transform_values(&:description).to_a
      end

      private

      def schemas
        @schemas ||= Hash.new { |h, k| h[k] = load_schema(k) }
      end

      def load_schema(name)
        JSON.parse(File.read("lib/schemas/#{name}.json"), object_class: OpenStruct, symbolize_names: true)
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
