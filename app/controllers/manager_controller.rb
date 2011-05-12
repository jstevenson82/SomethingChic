class ManagerController < ApplicationController

  def index_home
    @homes = Home.all
    @homes = @homes.paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new_home
    @home = Home.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit_home
    @home = Home.find(params[:id])
  end

  def create_home
    @home = Home.new(params[:home])

    respond_to do |format|
      if @home.save
        format.html { redirect_to(:home, :notice => 'Homepage image was successfully added.') }
      else
        format.html { render :action => "new_home" }
        flash[:error] = 'There was an error adding image.'
      end
    end
  end

  def update_home
    @home = Home.find(params[:id])

    respond_to do |format|
      if @home.update_attributes(params[:home])
        format.html { redirect_to( :manager_index_home, :notice => 'Image was successfully updated.') }
      else
        format.html { render :action => "edit_home" }
        flash[:error] = 'There was an error updating image.'
      end
    end
  end

  def destroy_home
    @home = Home.find(params[:id])
    @home.destroy

    respond_to do |format|
      format.html { redirect_to( manager_index_home_url) }
      flash[:notice] = 'Image was successfully deleted.'
    end
  end
  
  def index_blog
    @blogs = Blog.all
    @blogs = @blogs.paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
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
        format.html { render :action => "new_blog" }
        flash[:error] = 'There was a problem creating blog entry.'
      end
    end
  end

  def update_blog
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to(:manager_index_blog, :notice => 'Blog was successfully updated.') }
      else
        format.html { render :action => "edit_blog" }
        flash[:error] = 'There was a problem updating blog entry.'
      end
    end
  end

  def destroy_blog
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to(:manager_index_blog) }
      flash[:notice] = 'Blog entry was successfully deleted.'
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
    @gallery_sections = GallerySection.all

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit_gallery
    @gallery = Gallery.find(params[:id])
    @gallery_sections = GallerySection.all
  end

  def create_gallery
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save 
        format.html { redirect_to(:manager_index_gallery, :notice => 'Image was successfully add to the gallery.') }
      else
        format.html { render :action => "new_gallery" }
        flash[:error] = 'There was an issue add image to gallery.'
      end
    end
  end

  def update_gallery
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to(:manager_index_gallery, :notice => 'Gallery was successfully updated.') }
      else 
        format.html { render :action => "edit_gallery" }
        flash[:error] = 'There was an issue add image to gallery.'
      end
    end
  end

  def destroy_gallery
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to(:manager_index_gallery) }
      flash[:notice] = 'Image was successfully deleted.'
    end
  end

  #*******************
  #* Gallery Section *
  #*******************

  def index_gallery_sections
    @gallery_sections = GallerySection.all
    @gallery_sections = @gallery_sections.paginate(:page => params[:page], :per_page => 8)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def new_gallery_sections
    @gallery_section = GallerySection.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit_gallery_sections
    @gallery_section = GallerySection.find(params[:id])
  end

  def create_gallery_sections
    @gallery_section = GallerySection.new(params[:gallery_section])

    respond_to do |format|
      if @gallery_section.save
        format.html { redirect_to(:manager_index_gallery_sections, :notice => 'Gallery section was successfully created.') }
      else
        format.html { render :action => "new_gallery_sections" }
      end
    end
  end

  def update_gallery_sections
    @gallery_section = GallerySection.find(params[:id])

    respond_to do |format|
      if @gallery_section.update_attributes(params[:gallery_section])
        format.html { redirect_to(:manager_index_gallery_sections, :notice => 'Gallery section was successfully updated.') }
      else
        format.html { render :action => "edit_gallery_sections" }
        flash[:notice] = 'Gallery was successfully deleted.'
      end
    end
  end
  
  def destroy_gallery_sections
    @gallery_section = GallerySection.find(params[:id])
    @gallery_section.destroy

    respond_to do |format|
      format.html { redirect_to(:manager_index_gallery_sections) }
      flash[:notice] = 'Gallery was successfully deleted.'
    end
  end
  
end
