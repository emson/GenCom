class CreateDefaultSite < ActiveRecord::Migration
  def self.up
    Site.create!(:title=>"Dev Site", :domain=>"localhost", :notes=>"Development Site")
  end

  def self.down
    Site.find_by_title("Dev Site").destroy
  end
end