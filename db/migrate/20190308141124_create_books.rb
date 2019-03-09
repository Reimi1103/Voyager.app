class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :title
      t.string :prologue
      t.string :bookCover
      t.boolean :progress,dedault: false
      t.string :schedule

      t.timestamps
    end
  end
end
