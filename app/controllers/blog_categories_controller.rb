class BlogCategoriesController < ApplicationController

  layout "blog"

  def show
    @blog_category = BlogCategory.find(params[:id])
    @blogs = Blog.find(:all, :conditions => ["category_id=?", @blog_category.id ])
    @blogs = @blogs.paginate(:page => params[:page], :per_page => 4)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog_category }
    end
  end
 
end
