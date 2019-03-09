class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :image
      t.string :introduction
      t.string :email
      t.string :password_digest
      t.integer :points
      t.string :weblink
      t.string :thaksImage

      t.timestamps
    end
  end
end
