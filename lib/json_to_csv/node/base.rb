# frozen_string_literal: true

module JsonToCsv
  module Node
    class Base
      def initialize(parser, source, path)
        @parser = parser
        @source = source
        @path = path
      end

      def path
        @path.map {|component| component.gsub('.', '\.')}.join('.')
      end

      def parse
        raise NotImplementedError
      end
    end
  end
end
