require 'spec_helper'

describe "sites/index.html.erb" do
  before(:each) do
    assign(:sites, [
      stub_model(Site,
        :title => "Title",
        :domain => "Domain",
        :notes => "MyText"
      ),
      stub_model(Site,
        :title => "Title",
        :domain => "Domain",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of sites" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Domain".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
