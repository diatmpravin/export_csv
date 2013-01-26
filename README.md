# ExportCsv

ExportCsv is a small library intended to simplify the common steps involved with export table data to CSV files. ExportCsv is compatible with recent 1.8 versions of Ruby as well as Ruby 1.9+

## Installation

Add this line to your application's Gemfile:

    gem 'export_csv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install export_csv

## Example

### Example EXPORT CSV File 

    TODO: Write example here

### Example EXPORT CSV File using rake

    rake db:export_to_csv model=User

## Usage

### Example EXPORT CSV File 

    TODO: Write example here

### Example EXPORT CSV File using rake

    
If you have a table you want to backup into a csv in the rails db with a model: Model

    rake db:export_to_csv model=Model

the call writes into a csv file Model.csv located in the app root directory


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
