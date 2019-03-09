class CreateWithdrawals < ActiveRecord::Migration[5.2]
  def change
    create_table :withdrawals do |t|
      t.integer :user_id
      t.integer :withdrawal_point
      t.timestamps
    end
  end
end
