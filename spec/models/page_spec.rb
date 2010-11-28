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
    page = Factory.build(:page, :template => 'mock')
    snippetA = Factory.build(:snippet, :ref=>"refA")
    page.snippets << snippetA
    page.snippets << Factory.build(:snippet, :ref=>"refB")
    page.snippets << Factory.build(:snippet, :ref=>"refC")
    page.snippet_by_ref("refA").should == snippetA
  end
  
  it "should not be valid if there are no snippets for the role specified by the mock view" do
    page = Factory(:page, :template => 'mock')
    page.snippets << Factory.build(:snippet, :ref=>"refA")
    page.snippets << Factory.build(:snippet, :ref=>"refB")
    page.snippets << Factory.build(:snippet, :ref=>"refC")
    page.valid?
    page.errors[:snippets].should == []
  end
  
  
  it "should slugify the title" do
    page = Factory(:page, :title=>'John O\'Connors "best" day 21 of March-2010 best £100 & stuff')
    page.slugify!
    page.slug.should == 'john-o-connors-best-day-21-of-march-2010-best-100-stuff'
  end
  
  it "should call slugify! when saving a Page model" do
    page = Factory.build(:page, :title=>'Some % 0ff3rs @ the bank  !is good')
    page.expects(:slugify!)
    page.save
  end
  
  it "should not change the slug if the title is changed" do
    page = Factory(:page, :title=>'Some title')
    page.slug.should == 'some-title'
    page.title = "A new title"
    page.save
    page.slug.should == 'some-title'
  end
  
  it "should force a change to the slug if the force=true argument is provided" do
    page = Factory(:page, :title=>'Some title')
    page.slug.should == 'some-title'
    page.title = "A new title"
    page.slugify!(true)
    page.save
    page.slug.should == 'a-new-title'
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
#  template   :string(255)
#  slug       :string(255)
#

