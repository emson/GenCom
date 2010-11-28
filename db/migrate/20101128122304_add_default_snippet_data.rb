class AddDefaultSnippetData < ActiveRecord::Migration
  def self.up
    Page.first.snippets.create!(:ref=>"refA", :content=>"##Snippet refA")
    Page.first.snippets.create!(:ref=>"refB", :content=>"##Snippet refB")
    Page.first.snippets.create!(:ref=>"refC", :content=>"##Snippet refC")
  end

  def self.down
    Snippet.delete_all
  end
end
