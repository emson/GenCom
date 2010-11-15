class PagesController < ApplicationController
  
  before_filter :lookup_site
  
  def show
    # TODO aise 404 if slug does not exist in a page
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
