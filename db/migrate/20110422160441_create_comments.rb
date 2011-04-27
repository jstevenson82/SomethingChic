class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.string :website
      t.text :comment
      t.integer :blog_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end