class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :price
      t.integer :blog_category_id
      t.integer :gallery_section_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
