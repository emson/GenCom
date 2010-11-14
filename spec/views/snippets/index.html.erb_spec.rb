require 'spec_helper'

describe "snippets/index.html.erb" do
  before(:each) do
    assign(:snippets, [
      stub_model(Snippet,
        :ref => "Ref",
        :content => "MyText",
        :page_id => 1
      ),
      stub_model(Snippet,
        :ref => "Ref",
        :content => "MyText",
        :page_id => 1
      )
    ])
  end

  it "renders a list of snippets" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ref".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
