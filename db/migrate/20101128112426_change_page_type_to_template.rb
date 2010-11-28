class ChangePageTypeToTemplate < ActiveRecord::Migration
  def self.up
    rename_column :pages, :page_type, :template
  end

  def self.down
    rename_column :pages, :template, :page_type
  end
end
