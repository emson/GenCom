class AddColumnSlugToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :slug, :string
    Page.reset_column_information
  end

  def self.down
    remove_column :pages, :slug
  end
end
