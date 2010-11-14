require 'spec_helper'

describe Util do
  
  it "should return the path to the pages folder" do
    Util.pages_folder.end_with?("app/views/pages").should be_true
  end
  
  it "should extract roles from the view" do
    content = Util.extract_roles("mock")
    content.should =~ ["refA", "refC", "refB"]
  end
  
  
end

