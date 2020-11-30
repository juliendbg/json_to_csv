# frozen_string_literal: true

RSpec.describe JsonToCsv do
  it 'has a version number' do
    expect(JsonToCsv::VERSION).not_to be nil
  end
  [
    ['correctly converts the example file', 'users'],
    ['correctly handles unicode and inconsistent attributes', 'tricky'],
    ['correctly handles dot in key', 'dot_in_key']
  ].each do |description, filename|
    it description do
      input_path = File.join(File.dirname(__FILE__), 'files', "#{filename}.json")
      output_path = File.join(File.dirname(__FILE__), 'files', "#{filename}.csv")

      expected_result = File.open(output_path, 'r', &:read)

      Tempfile.open(%w[json_to_csv .csv]) do |f|
        described_class.convert(input_path, f.path)
        f.rewind

        expect(f.read).to eq(expected_result)
      end
    end
  end

  it 'does not support objects in arrays' do
    input_path = File.join(File.dirname(__FILE__), 'files/objects_in_array.json')

    Tempfile.open(%w[json_to_csv .csv]) do |f|
      expect { described_class.convert(input_path, f.path) }.to raise_error(JsonToCsv::NestedObjectInArrayError)
    end
  end
end
