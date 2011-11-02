class EventsController < ApplicationController

  layout "event"

  def index
    @events = Event.all
    @events = @events.paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  def show
    @event = Event.find(params[:id])
    @comment = Comment.new
    @blogs = Blog.find(:all, :conditions => ["category_id=?", @event.blog_category_id ], :limit => 2 )
    @galleries = Gallery.find(:all, :conditions => ["gallery_id=?", @event.gallery_section_id ], :limit => 4, :order => "RAND()" )
    @comments = Comment.find(:all, :conditions => ["blog_id=?", @event.id ], :limit => 4 )
    @comments = @comments.paginate(:page => params[:page], :per_page => 5)
    render :layout => "event_details"
  end
  
  def create_comment
    @comment = Comment.new(params[:comment])
    @blog = Blog.find(@comment.blog_id)    

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(event_view_path(@comment.blog_id,@blog.title), :notice => 'Comment was successfully created.') }
      else
        format.html { render :action => "show" }
      end
    end
  end
end
