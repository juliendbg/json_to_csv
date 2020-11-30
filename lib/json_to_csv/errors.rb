module JsonToCsv
  class Error < StandardError; end

  class NestedObjectInArrayError < Error; end

  class UnsupportedTypeError < Error
  end
end
