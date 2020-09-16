# frozen_string_literal: true

module Iuliia
  module Exceptions
    class NonExistentSchemaException < StandardError
      def initialize(msg = 'Specified schema does not exist')
        super
      end
    end
  end
end
