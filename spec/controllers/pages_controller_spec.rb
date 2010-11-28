require 'spec_helper'

describe PagesController do
  
  before :each do
    @site_attributes = Factory.attributes_for(:site)
    request.host = @site_attributes[:domain]
  end
  
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
    request.stubs(:fullpath).returns '/path/to/bad-slug-path'
    get(:show)
    response.status == "404"
  end
  
  it "should redirect to the default page for the domain root path" do
    site = Factory(:site)
    site.pages << Factory(:page)
    default_page = Factory(:page)
    site.pages << default_page
    site.default_page_id = default_page.id
    site.save!
    request.stubs(:fullpath).returns '/'
    get(:show)
    assigns(:page).should == default_page
    response.should render_template :mock
  end
  
  it "should redirect to the slugged page for this domain" do
    site = Factory(:site)
    good_page = Factory(:page)
    default_page = Factory(:page)
    site.pages << good_page
    site.pages << default_page
    site.default_page_id = default_page.id
    site.save!
    request.stubs(:fullpath).returns "/#{good_page.slug}"
    get(:show)
    assigns(:page).should == good_page
    response.should render_template :mock
  end
  
  
  
end
