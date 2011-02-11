class Admin::SnippetsController < ApplicationController
  layout "admin"
  
  
  # GET /snippets
  # GET /snippets.xml
  def index
    @snippets = Snippet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @snippets }
    end
  end

  # GET /snippets/1
  # GET /snippets/1.xml
  def show
    @snippet = Snippet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @snippet }
    end
  end

  # GET /snippets/new
  # GET /snippets/new.xml
  def new
    @snippet = PageSnippet.new
    
    # @site = Site.find(params[:site_id])
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @snippet }
    end
  end

  # GET /snippets/1/edit
  def edit
    @snippet = Snippet.find(params[:id])
    @site = Site.find(@snippet.page_id)
  end

  # POST /snippets
  # POST /snippets.xml
  def create
    @snippet = PageSnippet.new(params[:page_snippet])
    @snippet.page_id = params[:page_id]
    
    respond_to do |format|
      if @snippet.save
        format.html { redirect_to(admin_site_page_path(params[:site_id], params[:page_id]), :notice => 'Snippet was successfully created.') }
        format.xml  { render :xml => @snippet, :status => :created, :location => @snippet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @snippet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /snippets/1
  # PUT /snippets/1.xml
  def update
    @snippet = Snippet.find(params[:id])
    
    respond_to do |format|
      if @snippet.update_attributes(params[:page_snippet])
        format.html { redirect_to(admin_site_page_snippet_path(params[:site_id], params[:page_id], @snippet), :notice => 'Snippet was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @snippet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  # DELETE /snippets/1.xml
  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy

    respond_to do |format|
      format.html { redirect_to(admin_site_page_path(params[:site_id], params[:page_id])) }
      format.xml  { head :ok }
    end
  end
end
