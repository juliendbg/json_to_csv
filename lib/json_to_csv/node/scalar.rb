# frozen_string_literal: true

require 'json_to_csv/node/base'

module JsonToCsv
  module Node
    class Scalar < JsonToCsv::Node::Base
      def parse
        {
          path => serialize
        }
      end

      def serialize
        unless @source.is_a?(Numeric) || @source.is_a?(String)
          raise JsonToCsv::UnsupportedTypeError, "Unable to parse #{@source.inspect}, not a scalar value."
        end

        @source.to_s
      end
    end
  end
end
