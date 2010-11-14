class PopulateDefaultTypeForSnippet < ActiveRecord::Migration
  def self.up
    Snippet.all do |snippet|
      snippet.update_attribute(:type, "PageSnippet")
    end
  end

  def self.down
  end
end
