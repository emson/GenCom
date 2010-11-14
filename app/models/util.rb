module Util
  
  
  def self.pages_folder
    "#{Rails.root.to_s}/app/views/pages"
  end
  
  def self.extract_roles(page_name)
    content = IO.readlines("#{self.pages_folder}/#{page_name}.html.erb").join
    content.scan(/role="(.+)"/).flatten
  end
  
end