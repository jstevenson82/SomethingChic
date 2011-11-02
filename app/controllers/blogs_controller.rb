class BlogsController < ApplicationController

  layout "blog"

  def index
    @blogs = Blog.all
    @blogs = @blogs.paginate(:page => params[:page], :per_page => 4)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blogs }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    @blog = Blog.find(params[:id])
    @blog_category = BlogCategory.find(@blog.category_id)
    @comments = Comment.find(:all, :conditions => ["blog_id=?", @blog.id ])
    @comments = @comments.paginate(:page => params[:page], :per_page => 4)
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  def create_comment
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(blog_view_path(@comment.blog_id), :notice => 'Comment was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

end
