# frozen_string_literal: true

module Iuliia
  class << self
    # Translit cyrillic string to latin representation
    # @param string [String]
    # @param schema [Iuliia::Schema]
    # @return [String]
    def translit(string, schema:)
      Iuliia::Translit.new(string, schema).translit
    end
  end
end
