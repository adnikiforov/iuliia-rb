# frozen_string_literal: true

module Iuliia
  class << self
    # Translit cyrillic string to latin representation
    # @param string [String]
    # @param schema [Iuliia::Schema]
    # @return [String]
    def translit(string, schema:)
      warn "[DEPRECATION] Gem has been renamed to 'iuliia'. Please, use 'iuliia' instead."

      Iuliia::Translit.new(string, schema).translit
    end
  end
end
