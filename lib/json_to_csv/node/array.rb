# frozen_string_literal: true

require 'json_to_csv/node/base'

module JsonToCsv
  module Node
    class Array < JsonToCsv::Node::Base
      def parse
        {
          path => build_list
        }
      end

      def build_list
        result = @source.map do |object|
          @parser.parse(object)
        end
        result.join(',')
      end
    end
  end
end
