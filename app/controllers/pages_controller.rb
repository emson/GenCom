class PagesController < ApplicationController
  
  before_filter :lookup_site
  
  def show
    @page = @site.pages.find_by_slug(request.slug) unless request.root?
    @page = @site.default_page if request.root?
    unless @page
      response.status = 404
      render :file=>'public/404.html'
      return
    end
    render :template=>"pages/#{@page.template}"
  end
  
  def nosite
  end

  
  private
  
    def lookup_site
      # puts request.fullpath
      @site = Site.find_by_domain(request.host)
      redirect_to :action => "nosite" unless @site
    end
end
