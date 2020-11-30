# frozen_string_literal: true

require 'json_to_csv/node/base'

module JsonToCsv
  module Node
    class Hash < JsonToCsv::Node::Base
      def parse
        @source.map do |k, v|
          @parser.parse(v, path: @path + [k])
        end.flatten.reduce({}, :merge)
      end
    end
  end
end
