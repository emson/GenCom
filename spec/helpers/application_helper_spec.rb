require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the SnippetsHelper. For example:
#
# describe SnippetsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ApplicationHelper do

  before(:all) do
      @site = Factory(:site)
      @page1 = Factory(:page)
      @page2 = Factory(:page)
      @site.pages << @page1
      @site.pages << @page2
  end
  
  it "should collect a list of page tiles and page_ids for a specific site" do
    pages = helper.collect_pages(@site)
    pages.size.should == 2
    pages.should include([@site.pages[0].title, @site.pages[0].id])
    pages.should include([@site.pages[1].title, @site.pages[1].id])
  end
  
end
