# frozen_string_literal: true

RSpec.describe JsonToCsv do
  it 'has a version number' do
    expect(JsonToCsv::VERSION).not_to be nil
  end

  it 'correctly converts the example file' do
    input_path = File.join(File.dirname(__FILE__), 'files/users.json')
    output_path = File.join(File.dirname(__FILE__), 'files/users.csv')

    expected_result = File.open(output_path, 'r', &:read)

    Tempfile.open(%w[json_to_csv .csv]) do |f|
      described_class.convert(input_path, f.path)
      f.rewind

      expect(f.read).to eq(expected_result)
    end
  end
end
