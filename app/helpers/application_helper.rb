module ApplicationHelper
  def get_gallery_section(args)
    args[:category_id]  ||= 0
    @gallery_section = GallerySection.find(:first,:conditions => ['id = ?',args[:category_id]])
    ret = @gallery_section.title
    return ret
   end
   
   def get_blog_category(args)
    args[:blog_category_id]  ||= 0
    @blog_category = BlogCategory.find(:first,:conditions => ['id = ?',args[:blog_category_id]])
    ret = @blog_category.title
    return ret
   end
end
