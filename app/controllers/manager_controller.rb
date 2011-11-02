class ManagerController < ApplicationController

  def index_home
    @homes = Home.all
    @homes = @homes.paginate(:page => params[:page], :per_page => 10)

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
    @blogs = @blogs.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new_blog
    @blog = Blog.new
    @blog_categories = BlogCategory.all

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit_blog
    @blog = Blog.find(params[:id])
    @blog_categories = BlogCategory.all
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
    @galleries = Gallery.find(:all, :order => "created_at desc")
    @galleries = @galleries.paginate(:page => params[:page], :per_page => 30)

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
    @gallery_sections = GallerySection.all

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
    @gallery_sections = GallerySection.all

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
  
  #*******************
  #* Blog Categories *
  #*******************

  def index_blog_categories
    @blog_categories = BlogCategory.all
    @blog_categories = @blog_categories.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new_blog_categories
    @blog_category = BlogCategory.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit_blog_categories
    @blog_category = BlogCategory.find(params[:id])
  end

  def create_blog_categories
    @blog_category = BlogCategory.new(params[:blog_category])

    respond_to do |format|
      if @blog_category.save
      	format.html { redirect_to(:manager_index_blog_categories, :notice => 'Blog category was successfully created.') }
      else
      	format.html { render :action => "new_blog_categories" }
      end
    end
  end

  def update_blog_categories
    @blog_category = BlogCategory.find(params[:id])

    respond_to do |format|
      if @blog_category.update_attributes(params[:blog_category])
      	format.html { redirect_to(:manager_index_blog_categories, :notice => 'Blog category was successfully updated.') }
      else
        format.html { render :action => "edit_blog_categories" }
        flash[:notice] = 'Blog category was successfully deleted.'
      end
    end
  end

  def destroy_blog_categories
    @blog_category = BlogCategory.find(params[:id])
    @blog_category.destroy

    respond_to do |format|
      format.html { redirect_to(:manager_index_blog_categories) }
      flash[:notice] = 'Blog category was successfully deleted.'
    end
  end
  
  #*******************
  #**** Services *****
  #*******************
 
  def index_services
    @services = Service.all
    @services = @services.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def new_services
    @service = Service.new
    @galleries = Gallery.find(:all, :order => "gallery_id desc")

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit_services
    @service = Service.find(params[:id])
    @galleries = Gallery.find(:all, :order => "gallery_id desc")
  end

  def create_services
    @service = Service.new(params[:service])
    @galleries = Gallery.find(:all, :order => "gallery_id desc")

    respond_to do |format|
      if @service.save
      	format.html { redirect_to(:manager_index_services, :notice => 'Service was successfully added.') }
      else
      	format.html { render :action => "new_services" }
      end
    end
  end

  def update_services
    @service = Service.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to(:manager_index_services, :notice => 'Service was successfully updated.') }
      else
        format.html { render :action => "edit_services" }
        flash[:notice] = 'Service was successfully deleted.'
      end
    end
  end

  def destroy_services
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to(:manager_index_services) }
      flash[:notice] = 'Service was successfully deleted.'
    end
  end
    
  #*******************
  #***** Events ******
  #*******************
 
  def index_events
    @events = Event.all
    @events = @events.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def new_events
    @event = Event.new
    @gallery_sections = GallerySection.all
    @blog_categories = BlogCategory.all
    @galleries = Gallery.find(:all, :order => "gallery_id desc")

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit_events
    @event = Event.find(params[:id])
    @gallery_sections = GallerySection.all
    @blog_categories = BlogCategory.all
    @galleries = Gallery.find(:all, :order => "gallery_id desc")
  end

  def create_events
    @event = Event.new(params[:event])
    @gallery_sections = GallerySection.all
    @blog_categories = BlogCategory.all
    @galleries = Gallery.find(:all, :order => "gallery_id desc")

    respond_to do |format|
      if @event.save
      	format.html { redirect_to(:manager_index_events, :notice => 'Event was successfully added.') }
      else
      	format.html { render :action => "new_events" }
      end
    end
  end

  def update_events
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(:manager_index_events, :notice => 'Event was successfully updated.') }
      else
        format.html { render :action => "edit_events" }
        flash[:notice] = 'Event was successfully deleted.'
      end
    end
  end

  def destroy_events
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(:manager_index_events) }
      flash[:notice] = 'Event was successfully deleted.'
    end
  end
end
