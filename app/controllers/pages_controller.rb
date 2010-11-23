class PagesController < ApplicationController
  
  before_filter :lookup_site
  
  def show
    page = @site.pages.find_by_slug(request.path)
    
    unless page
      response.status = 404
      render :file=>'public/404.html'
    end
    
  end
  
  def nosite
  end

  
  private
  
    def lookup_site
      @site = Site.find_by_domain(request.host)
      puts @site
      redirect_to :action => "nosite" unless @site
    end
end
