class SitesController < ApplicationController
  
  before_filter :lookup_site
  
  def nosite
  end

  
  private
  
    def lookup_site
      @site = Site.find_by_domain(request.host)
      redirect_to :action => "nosite" unless @site
    end
  
  
end
