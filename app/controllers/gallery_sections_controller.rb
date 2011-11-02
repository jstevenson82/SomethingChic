class GallerySectionsController < ApplicationController

  layout "galleries"

  def index
    @gallery_sections = GallerySection.all
    @gallery_sections = @gallery_sections.paginate(:page => params[:page], :per_page => 8)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gallery_sections }
    end
  end

  def show
    @gallery_section = GallerySection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gallery_section }
    end
  end

end
