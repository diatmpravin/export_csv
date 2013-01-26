class Extension

  class << self

    def ext file
      @ext = File.extname(file)
      if !@ext.nil? and !@ext.blank? and @ext.to_s == ".csv"
        return file
      else
        return file.split('.').first + '.' + 'csv'
      end
    end

  end

end