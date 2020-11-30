# frozen_string_literal: true

require 'json'

require 'json_to_csv/node/array'
require 'json_to_csv/node/hash'
require 'json_to_csv/node/scalar'

module JsonToCsv
  class Parser
    def initialize(source)
      @source = JSON.parse(source)
      @tree = []
    end

    def parse(obj = nil, path: [])
      return @source.map { |record| parse(record) } if obj.nil?

      case obj
      when Array
        Node::Array.new(self, obj, path).parse
      when Hash
        Node::Hash.new(self, obj, path).parse
      else
        Node::Scalar.new(self, obj, path).parse
      end
    end
  end
end
