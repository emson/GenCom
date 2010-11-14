

Factory.define :site do |site|
  site.title "Simple Site"
  site.domain "simplesite.com"
  site.default_page 1
end

Factory.define :page do |page|
  page.title "my page title"
  page.page_type "mock"
end

Factory.define :snippet do |snippet|
  snippet.sequence(:ref) { |num| "ref-#{num}" }
  snippet.content "<h2>Some Content</h2>"
end
