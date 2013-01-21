module ExportCsv
  if RUBY_VERSION =~ /1.8/
    require 'fastercsv'
    CSV = FasterCSV
  else
    require 'csv'
  end

  module Base

    private

    def export_to_csv(filename, content, options = {})
      csv_options = {}
      csv_options[:col_sep] = options[:separator] || ','
      model_dir = Dir['**/models/**/*.rb'].detect {|f| content == File.basename(f, '.*').camelize}
      if !model_dir.eql?(nil)
        table = File.basename(model_dir, '.*').camelize.constantize
        objects = table.all
        data = CSV.generate(csv_options) do |csv|
          csv << table.column_names
          row = Array.new
          objects.each do |obj|
            table.column_names.each do |col|
              row << obj[col]
            end
            csv << row
            row.clear
          end
        end
      else
        puts "Table #{ENV['model']} could not be found"
      end

      send_data(data, :filename => filename,:type => 'text/csv')
    end

  end

end
