require 'spec_helper'

describe SitesController do
  
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
    response.should redirect_to "/sites/nosite"
  end
  
  
end
