require "export_csv/version"
require "rake_export/railtie"
require 'active_support'

module ExportCsv
  extend ActiveSupport::Autoload
  autoload :Base
end

ActiveSupport.on_load(:action_controller) do
  include ExportCsv::Base
end