require 'spec_helper'

describe PagesController do

  
  it "should correctly look up a site by domain name" do
    site = Factory(:site)
    request.stubs(:host).returns site.domain
    get(:nosite)
    assigns(:site).should == site
  end
  
  it "should redirect to the nosite view if no domain names match" do
    site = Factory(:site)
    request.stubs(:host).returns "rubbish.com"
    get(:nosite)
    response.should redirect_to "/pages/nosite"
  end
  
  it "should redirect to a 404 error page if the slug doesn't exist" do
    site = Factory(:site)
    request.stubs(:host).returns site.domain
    request.stubs(:path).returns '/path/to/bad-slug-path'
    get(:show)
    response.status == "404"
  end
  
  it "should redirect to the default page for the domain root path" do
    
  end
  
  
end
