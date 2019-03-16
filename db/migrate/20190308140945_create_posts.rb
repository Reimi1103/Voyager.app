class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :text
      t.string :image1
      t.string :image2
      t.string :image3
      t.float :longitude
      t.float :latitude
      t.integer :book_id

      t.timestamps

      t.references :user, index: true, foreign_key: true
    end
    add_index :posts, [:user_id, :created_at]
  end
end
