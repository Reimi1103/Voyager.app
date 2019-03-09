json.extract! bank_account, :id, :bank_name, :bank_code, :branch_name, :branch_code, :bank_type, :bank_holder, :bank_number, :user_id, :created_at, :updated_at
json.url bank_account_url(bank_account, format: :json)
