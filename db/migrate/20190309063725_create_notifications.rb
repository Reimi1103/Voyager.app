class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :text
      t.string :category
      t.string :eyecatch
      t.timestamps
    end
  end
end
