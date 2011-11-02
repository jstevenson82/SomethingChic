class AddBlogCategoryIdToBlogs < ActiveRecord::Migration
  def self.up
    add_column :blogs, :category_id, :integer
  end

  def self.down
    remove_column :blogs, :category_id
  end
end
