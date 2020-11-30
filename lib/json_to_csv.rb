# frozen_string_literal: true

require 'json_to_csv/version'
require 'json_to_csv/parser'
require 'json_to_csv/exporter'

module JsonToCsv

  def self.convert(input_path, output_path)
    f = File.open(input_path)
    tree = JsonToCsv::Parser.new(f.read).parse
    f.close

    JsonToCsv::Exporter.new(tree).export(output_path)
  end
end
