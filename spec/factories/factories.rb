

Factory.define :site do |site|
  site.title "Simple Site"
  site.domain "simplesite.com"
end

Factory.define :page do |page|
  page.sequence(:title) { |num| "Page Title Number: #{num}" }
  page.template "mock"
end


Factory.define :snippet do |snippet|
  snippet.sequence(:ref) { |num| "ref-#{num}" }
  snippet.content "<h2>Some Content</h2>"
end
