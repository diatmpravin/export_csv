require "export_csv/file"

module ExportCsv
  if RUBY_VERSION =~ /1.8/
    require 'fastercsv'
    CSV = FasterCSV
  else
    require 'csv'
  end

  module Base

    private

    def export_to_csv(filename, model, escape_att ,options = {})
      csv_options = {}
      csv_options[:col_sep] = options[:separator] || ','

      headers = options[:headers]
      csv_options[:headers] = headers.present?

      filename = Extension.ext filename

      begin
        model_dir = Dir['**/models/**/*.rb'].detect {|f| model == File.basename(f, '.*').camelize}
        if !model_dir.eql?(nil)
          table = File.basename(model_dir, '.*').camelize.constantize
          objects = table.all
          begin
            data = CSV.generate(csv_options) do |csv|
              if csv_options[:headers]
                csv << headers
              else
                headers = table.column_names.delete_if {|k, v|  escape_att.include? k }
                csv << headers.map {|k| k.gsub(/_/, ' ').capitalize}
              end
              row = Array.new
              objects.each do |obj|
                headers.each do |col|
                  begin
                    row << obj[col]
                  rescue Exception => e
                    row << 'Invalid data field'
                  end
                end
                csv << row
                row.clear
              end
            end
          rescue SystemCallError
            $stderr.print "IO failed: " + $!
            raise
          end
        else
          puts "Table #{ENV['model']} could not be found"
        end
      rescue SystemCallError
        $stderr.print "IO failed: " + $!
        raise
      end

      send_data(data, :filename => filename,:type => 'text/csv')
    end

  end

end
