class AddDefaultPageIdColumnToSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :default_page_id, :integer
  end

  def self.down
    remove_column :sites, :default_page_id
  end
end
