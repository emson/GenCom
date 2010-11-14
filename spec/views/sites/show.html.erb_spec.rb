require 'spec_helper'

describe "sites/show.html.erb" do
  before(:each) do
    @site = assign(:site, stub_model(Site,
      :title => "Title",
      :domain => "Domain",
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Domain/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
