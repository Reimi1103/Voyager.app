class BankAccount < ApplicationRecord
  #表示メッセージはcongig/ja.ymlで設定
  #viewではeachを使って表示しないと、ハッシュ出力の[""]がついてしまうので注意
  validates :bank_name,
  presence: {
    message: -> (rec, data) do
      I18n.t('no_bank_name')
    end}
  validates :bank_name,
    length: { minimum: 1 } 





  validates :bank_code, presence: true
  validates :branch_name, presence: true
  validates :branch_code, presence: true
  validates :bank_type, presence: true
  validates :bank_holder, presence: true
  validates :bank_number, presence: true


  belongs_to :user#



end


