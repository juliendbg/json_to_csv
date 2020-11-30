# JsonToCsv

A small Ruby lib aiming to convert JSON files composed of arrays of objects (all following the same schema)
to a CSV file where one line equals one object.

This project has been developed as a job interview technical test.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'json_to_csv'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install json_to_csv

## Usage

At the moment, this gem converts a JSON file to a CSV file. It does not support reading from stdin or memory, and it
can't write to stdout or memory.

To convert `/path/to/input.json` to `/path/to/output.csv`:

```ruby
JsonToCsv.convert('/path/to/input.json', '/path/to/output.csv')
```
