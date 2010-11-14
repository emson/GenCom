require 'spec_helper'

describe "snippets/show.html.erb" do
  before(:each) do
    @snippet = assign(:snippet, stub_model(Snippet,
      :ref => "Ref",
      :content => "MyText",
      :page_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Ref/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
