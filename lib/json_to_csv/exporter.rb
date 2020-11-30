# frozen_string_literal: true

require 'csv'

module JsonToCsv
  class Exporter
    def initialize(tree)
      @tree = tree
    end

    def detect_columns
      columns = Set.new

      @tree.each do |record|
        columns |= record.keys
      end

      @columns = columns.to_a
    end

    def export(output_path)
      CSV.open(output_path, 'wb') do |csv|
        csv << detect_columns

        @tree.each do |record|
          csv << @columns.map { |col| record[col] || '' }
        end
      end
    end
  end
end
