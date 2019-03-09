class CreateBankAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_accounts do |t|
      t.string :bank_name
      t.integer :bank_code
      t.string :branch_name
      t.integer :branch_code
      t.string :bank_type
      t.string :bank_holder
      t.integer :bank_number
      t.integer :user_id

      t.timestamps
    end
  end
end
