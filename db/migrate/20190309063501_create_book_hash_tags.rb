class CreateBookHashTags < ActiveRecord::Migration[5.2]
  def change
    create_table :book_hash_tags do |t|
      t.integer :book_id
      t.string :tag

      t.timestamps
    end
  end
end
