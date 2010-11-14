require 'spec_helper'

describe "snippets/edit.html.erb" do
  before(:each) do
    @snippet = assign(:snippet, stub_model(Snippet,
      :new_record? => false,
      :ref => "MyString",
      :content => "MyText",
      :page_id => 1
    ))
  end

  it "renders the edit snippet form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => snippet_path(@snippet), :method => "post" do
      assert_select "input#snippet_ref", :name => "snippet[ref]"
      assert_select "textarea#snippet_content", :name => "snippet[content]"
      assert_select "input#snippet_page_id", :name => "snippet[page_id]"
    end
  end
end
