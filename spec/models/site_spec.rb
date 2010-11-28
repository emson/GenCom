require 'spec_helper'

describe Site do
  
  describe "Pages" do
    it "should return the page with a matched slug" do
      site = Factory(:site)
      page = Factory(:page, :slug=>'my-nice-page')
      site.pages << page
      site.page_by_slug('my-nice-page').should == page
    end
    
    it "should return nil if a page slug does not exist" do
      site = Factory(:site)
      page = Factory(:page, :slug=>'my-nice-page')
      site.pages << page
      site.page_by_slug('bad-page').should be_nil
    end
    
  end
  
  it "should be valid if a page exists and a default page is set" do
    site = Factory(:site)
    a_page = Factory(:page)
    site.pages << a_page
    site.default_page_id = a_page.id
    site.valid?
    site.errors[:default_page_id].should == []
  end
  
  it "should not be valid if a page exists and a default page is not available" do
    site = Factory(:site)
    a_page = Factory(:page)
    site.pages << a_page
    site.default_page_id = a_page.id + 100
    site.valid?
    site.errors[:default_page_id].should == ["default page must exist"]
  end
  
  
  
  it "should validate that a default page must exist if pages.count > 0" do
    site = Factory(:site)
    a_page = Factory(:page)
    site.pages << a_page
    site.valid?
    site.errors[:default_page_id].include?("default page must exist").should be_true
  end
  
  it "should not validate that a default page must exist if pages.count equals 0" do
    site = Factory(:site)
    site.valid?
    site.errors[:default_page_id].should == []
  end
  
  
  
end




# == Schema Information
#
# Table name: sites
#
#  id              :integer         not null, primary key
#  title           :string(255)
#  domain          :string(255)
#  notes           :text
#  created_at      :datetime
#  updated_at      :datetime
#  default_page_id :integer
#

