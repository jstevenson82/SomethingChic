class CreateGallerySections < ActiveRecord::Migration
  def self.up
    create_table :gallery_sections do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :gallery_sections
  end
end
