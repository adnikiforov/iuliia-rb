# frozen_string_literal: true

module Iuliia
  class Translit
    ENDING_LENGTH = 2
    private_constant :ENDING_LENGTH

    # Initialize transliterator engine with string and schema
    # @param string [String]
    # @param schema [Iuliia::Schema]
    # @return [Iuliia::Translit]
    def initialize(string, schema)
      @string = string
      @schema = Iuliia::Schema[schema]
    end

    # Translit cyrillic string to latin representation
    # @return [String]
    def translit
      return unless schema

      string.split(/\b/).map { |chunk| translit_chunk(chunk) }.join
    end

    private

    attr_reader :string, :schema

    def translit_chunk(chunk)
      return chunk unless /\p{l}+/.match?(chunk)

      stem, ending = split_word(chunk)

      return translit_stem(chunk) if ending.empty?

      translited_ending = schema.ending_mapping&.dig(ending)
      return translit_stem(chunk) if translited_ending.nil?

      translited_stem = translit_stem(stem)

      [translited_stem, translited_ending].join
    end

    def translit_stem(stem)
      translited_stem = stem.chars.each_with_index.map do |char, index|
        translit_char(stem.chars, char, index)
      end

      string = translited_stem.join
      return camelcase(translited_stem.join) unless upcase?(translited_stem.join)

      string
    end

    def translit_char(chars, char, index)
      return char unless /[А-Яа-яёЁ]/.match?(char)

      translited_char = translit_prev(chars, index)
      translited_char = translit_next(chars, index) if translited_char.nil?
      translited_char = schema.mapping[char.downcase] if translited_char.nil?

      upcase?(char) ? camelcase(translited_char.upcase) : translited_char
    end

    def translit_prev(chars, index)
      prev_char =
        if index.positive?
          chars[index - 1..index].join.downcase
        else
          chars[index].downcase
        end

      schema.prev_mapping&.dig(prev_char)
    end

    def translit_next(chars, index)
      next_char = chars[index..index + 1].join.downcase
      schema.next_mapping&.dig(next_char)
    end

    def split_word(word)
      if word.length <= ENDING_LENGTH
        [word, '']
      else
        ending = word.length > ENDING_LENGTH ? word[-ENDING_LENGTH..-1] : ''
        stem = word[0..(word.length - ENDING_LENGTH - 1)] || word

        [stem, ending]
      end
    end

    def upcase?(char)
      /[[:upper:]]/.match(char)
    end

    def camelcase(string)
      return string unless upcase?(string[0])

      string = string.downcase
      string[0] = string[0].capitalize
      string
    end
  end
end
