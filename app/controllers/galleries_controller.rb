class GalleriesController < ApplicationController
	
  layout "gallery"
	
  # GET /galleries
  # GET /galleries.xml
  def index
    #@galleries = Gallery.all
    gallery_id = params[:id]
    @galleries = Gallery.find(:all, :conditions => "gallery_id=#{gallery_id}")
    @gallery_section = GallerySection.find(params[:id])
    @galleries = @galleries.paginate(:page => params[:page], :per_page => 8)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.xml
  def show
    @gallery = Gallery.find(params[:id])
    @comments = Comment.find(:all, :conditions => "blog_id=1212#{@gallery.id}")
    @comments = @comments.paginate(:page => params[:page], :per_page => 4)
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gallery }
    end
  end
  
  def create_comment
    @comment = Comment.new(params[:comment])    
    gallery_id = @comment.blog_id.to_s.gsub('1212','')

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(picture_view_path(gallery_id), :notice => 'Comment was successfully created.') }
      else
      	@gallery = Gallery.find(params[:id])
      	@comments = Comment.find(:all, :conditions => "blog_id=#{@gallery.id}")
        format.html { redirect_to(picture_view_path(@gallery.id)) }
      end
    end
  end
  
end
