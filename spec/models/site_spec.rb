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
  
end



# == Schema Information
#
# Table name: sites
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  domain       :string(255)
#  notes        :text
#  created_at   :datetime
#  updated_at   :datetime
#  default_page :integer
#

