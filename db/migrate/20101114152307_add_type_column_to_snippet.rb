class AddTypeColumnToSnippet < ActiveRecord::Migration
  def self.up
    add_column :snippets, :type, :string
  end

  def self.down
    remove_column :snippets, :type
  end
end
