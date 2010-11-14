require 'spec_helper'

describe "snippets/new.html.erb" do
  before(:each) do
    assign(:snippet, stub_model(Snippet,
      :ref => "MyString",
      :content => "MyText",
      :page_id => 1
    ).as_new_record)
  end

  it "renders new snippet form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => snippets_path, :method => "post" do
      assert_select "input#snippet_ref", :name => "snippet[ref]"
      assert_select "textarea#snippet_content", :name => "snippet[content]"
      assert_select "input#snippet_page_id", :name => "snippet[page_id]"
    end
  end
end
