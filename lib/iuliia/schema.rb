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

      def lib_dir
        File.expand_path('..', __dir__)
      end

      def schemas
        @schemas ||= Hash.new { |h, k| h[k] = load_schema(k) }
      end

      def load_schema(name)
        filename = "#{lib_dir}/schemas/#{name}.json"
        raise Exceptions::NonExistentSchemaException unless File.exist?(filename)

        JSON.parse(File.read(filename), object_class: OpenStruct, symbolize_names: true)
      end

      def load_schemas
        Dir["#{lib_dir}/schemas/*.json"].map do |file|
          schema = load_schema(File.basename(file, '.json'))
          [schema.name, schema]
        end.to_h
      end
    end
  end
end
