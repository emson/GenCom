require 'spec_helper'

describe Page do
  
  it "should allow uniquely named snippets, by ref" do
    page = Factory.build(:page)
    (page.snippets << Factory.build(:snippet, :ref=>"ref-A")).should_not be_nil
    (page.snippets << Factory.build(:snippet, :ref=>"ref-B")).should_not be_nil
    (page.snippets << Factory.build(:snippet, :ref=>"ref-C")).should_not be_nil
  end
  
  it "should fail if a duplicate snippet ref is added" do
    page = Factory.build(:page)
    (page.snippets << Factory.build(:snippet, :ref=>"ref-A")).should_not be_nil
    (page.snippets << Factory.build(:snippet, :ref=>"ref-A")).should_not be_false
   
  end
  
  it 'should return the snippet by ref' do
    page = Factory.build(:page, :page_type => 'mock')
    snippetA = Factory.build(:snippet, :ref=>"refA")
    page.snippets << snippetA
    page.snippets << Factory.build(:snippet, :ref=>"refB")
    page.snippets << Factory.build(:snippet, :ref=>"refC")
    page.snippet_by_ref("refA").should == snippetA
  end
  
  it "should not be valid if there are no snippets for the role specified by the mock view" do
    page = Factory(:page, :page_type => 'mock')
    page.snippets << Factory.build(:snippet, :ref=>"refA")
    page.snippets << Factory.build(:snippet, :ref=>"refB")
    page.snippets << Factory.build(:snippet, :ref=>"refC")
    page.valid?
    page.errors[:snippets].should == []
  end
  
  
end


# == Schema Information
#
# Table name: pages
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  site_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  page_type  :string(255)
#

