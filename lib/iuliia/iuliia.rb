# frozen_string_literal: true

module Iuliia
  class << self
    def translit(string, schema:)
      Iuliia::Translit.new(string, schema).translit
    end
  end
end
