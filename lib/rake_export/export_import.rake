require 'csv'

namespace :db do
  desc "Export database table into a csv file"
  task :export_to_csv => :environment do
    model_dir = Dir['**/models/**/*.rb'].detect {|f| ENV['model'] == File.basename(f, '.*').camelize}
    if !model_dir.eql?(nil)    
      table = File.basename(model_dir, '.*').camelize.constantize
      objects = table.all
      CSV.open("#{table}.csv", "wb") do |csv|
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
  end
end
