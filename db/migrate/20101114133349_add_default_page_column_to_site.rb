class AddDefaultPageColumnToSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :default_page, :integer
  end

  def self.down
    remove_column :sites, :default_page
  end
end
