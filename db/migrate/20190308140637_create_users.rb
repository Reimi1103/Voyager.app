class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :image
      t.string :introduction
      t.string :email
      t.string :password_digest
      t.integer :point, default: 1000
      t.string :weblink
      t.string :thanksImage

      t.timestamps
    end
  end
end
