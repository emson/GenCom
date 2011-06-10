require 'spec_helper'

describe Admin::SitesController do
  
  it "should redirect to admin/sites when a site is created" do
    site = Factory :site
    Site.stubs(:new).with({'a'=>1, 'b'=>2}).returns(site)
    site.stubs(:save).returns(true)
    post(:create, :site => {'a'=>1, 'b'=>2})
    response.should redirect_to(admin_sites_url)
  end
  
  it "should redirect to the new page with errors if it fails" do
    site = Factory :site
    Site.stubs(:new).with({'a'=>1, 'b'=>2}).returns(site)
    site.stubs(:save).returns(false)
    post(:create, :site => {'a'=>1, 'b'=>2})
    response.should render_template(:new)
  end

end