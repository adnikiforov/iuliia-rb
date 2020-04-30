# frozen_string_literal: true

module Iuliia
  module_function

  def translit(string, schema:)
    Iuliia::Translit.new(string, schema).translit
  end
end
