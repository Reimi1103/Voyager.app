class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :text
      t.string :image1
      t.string :image2
      t.string :image3
      t.integer :longitude
      t.integer :latitude
      t.integer :book_id

      t.timestamps
    end
  end
end
