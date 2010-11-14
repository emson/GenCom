class AddColumnSiteIdToSnippet < ActiveRecord::Migration
  def self.up
    add_column :snippets, :site_id, :integer
  end

  def self.down
    remove_column :snippets, :site_id
  end
end
