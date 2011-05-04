class ManagerController < ApplicationController

  def index_home
    @homes = Home.all
    @homes = @homes.paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /homes/new
  # GET /homes/new.xml
  def new_home
    @home = Home.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  # GET /homes/1/edit
  def edit_home
    @home = Home.find(params[:id])
  end

  # POST /homes
  # POST /homes.xml
  def create_home
    @home = Home.new(params[:home])

    respond_to do |format|
      if @home.save
        format.html { redirect_to(:home, :notice => 'Home was successfully created.') }
      else
        format.html { render :action => "new_home" }
      end
    end
  end

  def update_home
    @home = Home.find(params[:id])

    respond_to do |format|
      if @home.update_attributes(params[:home])
        format.html { redirect_to( :manager_index_home, :notice => '<div class="flash-sucess">Image was successfully updated.</div>') }
      else
        format.html { redirect_to(manager_edit_home_url(@home), :notice => '<div class="flash-failure">There was an error update image.</div>') }
      end
    end
  end

  def destroy_home
    @home = Home.find(params[:id])
    @home.destroy

    respond_to do |format|
      format.html { redirect_to( manager_index_home_url, :notice => '<div class="flash-sucess">Image was deleted.</div>' ) }
    end
  end
  
  def index_blog
    @blogs = Blog.all
    @blogs = @blogs.paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blogs }
    end
  end

  def new_blog
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit_blog
    @blog = Blog.find(params[:id])
  end

  def create_blog
    @blog = Blog.new(params[:blog])

    respond_to do |format|
      if @blog.save
        format.html { redirect_to(:manager_index_blog, :notice => 'Blog was successfully created.') }
      else
        format.html { redirect_to(:manager_new_blog, :error => 'There was a problem creating blog entry.') }
      end
    end
  end

  def update_blog
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to(:manager_index_blog, :notice => 'Blog was successfully updated.') }
      else
        format.html { redirect_to(:manager_edit_blog, :error => 'There was a problem updating blog entry.') }
      end
    end
  end

  def destroy_blog
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to(:manager_index_blog) }
    end
  end

  #*******************
  #**** Gallery ******
  #*******************

  def index_gallery
    @galleries = Gallery.all
    @galleries = @galleries.paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new_gallery
    @gallery = Gallery.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit_gallery
    @gallery = Gallery.find(params[:id])
  end

  def create_gallery
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to(@gallery, :notice => 'Gallery was successfully created.') }
      else
        format.html { render :action => "new_gallery" }
      end
    end
  end

  def update_gallery
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to(@gallery, :notice => 'Gallery was successfully updated.') }
      else
        format.html { render :action => "edit_gallery" }
      end
    end
  end

  def destroy_gallery
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to(galleries_url) }
    end
  end
  
end
