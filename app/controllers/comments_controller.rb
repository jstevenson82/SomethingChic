class CommentsController < ApplicationController

  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save && simple_captcha_valid?
        format.html { redirect_to(blog_view_path(@comment.blog_id), :notice => 'Comment was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def remove_comment_blog
    @comment = Comment.find(params[:id])
    blog_id = params[:blog_id]
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(blog_view_url(blog_id)) }
    end
  end
  
 def remove_comment_gallery
    @comment = Comment.find(params[:id])
    blog_id = params[:blog_id]
    blog_id = blog_id.to_s.gsub('1212','')
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(picture_view_url(blog_id)) }
    end
  end
  
end
