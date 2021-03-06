class CreateDefaultPage < ActiveRecord::Migration
  def self.up
    site = Site.find_by_title("Dev Site")
    page = Page.create(:title=>"Dev Page", :site_id=>site.id, :template=>"col_3")
    site.update_attributes(:default_page_id=>page.id)
  end

  def self.down
    Page.find_by_title("Dev Page").destroy
  end
end
