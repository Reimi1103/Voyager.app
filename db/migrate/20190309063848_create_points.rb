class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :usePoint
      t.timestamps
    end
  end
end
