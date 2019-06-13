class Comment < ApplicationRecord
#表示メッセージはcongig/ja.ymlで設定
#viewではeachを使って表示しないと、ハッシュ出力の[""]がついてしまうので注意
  # 表示順
  default_scope -> { order(created_at: :desc) }

  belongs_to :user#
  belongs_to :post#
  has_one :point#

end
