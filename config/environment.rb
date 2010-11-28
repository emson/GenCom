# Load the rails application
require File.expand_path('../application', __FILE__)

Dir.glob("lib/core_ext/*.rb").each do |f|
  require f
end

# Initialize the rails application
Gencom::Application.initialize!
