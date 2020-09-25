# frozen_string_literal: true

module Iuliia
  class << self
    # Translate cyrillic string to latin representation
    # @param string [String]
    # @param schema [Iuliia::Schema]
    # @return [String]
    def translate(string, schema:)
      Iuliia::Translit.new(string, schema).translit
    end

    def translit(string, schema:)
      warn 'translit is deprecated, use .translate instead'
      translate(string, schema: schema)
    end
  end
end
