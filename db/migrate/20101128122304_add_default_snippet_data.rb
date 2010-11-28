class AddDefaultSnippetData < ActiveRecord::Migration
  def self.up
    Site.first.create_header_snippet(:content=>"##Snippet Header")
    Site.first.create_footer_snippet(:content=>"##Snippet Footer")
    Site.first.create_sidebar_snippet(:content=>"##Snippet SidBar")
    
    Page.first.page_snippets.create!(:ref=>"refA", :content=>"##Snippet refA")
    Page.first.page_snippets.create!(:ref=>"refB", :content=>"##Snippet refB")
    Page.first.page_snippets.create!(:ref=>"refC", :content=>"##Snippet refC")
  end

  def self.down
    Snippet.delete_all
  end
end
