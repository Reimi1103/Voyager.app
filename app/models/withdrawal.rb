class Withdrawal < ApplicationRecord
  validates :withdrawal_point, :numericality => { :greater_than_or_equal_to => 500 },presence: true

  belongs_to :user#
end
