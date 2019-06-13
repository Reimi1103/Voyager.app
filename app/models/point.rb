class Point < ApplicationRecord
#表示メッセージはcongig/ja.ymlで設定
#viewではeachを使って表示しないと、ハッシュ出力の[""]がついてしまうので注意

  def pointCheck(usePoint,curPoint)
    errors.add(:usePoint,"ポイントが足りません") unless curPoint > usePoint
  end

  def pointCheck2(usePoint)
    if usePoint > 0 && usePoint < 10
      errors.add(:usePoint,"10ポイントから利用できます") 
    end
  end
  
  belongs_to :user#
  belongs_to :comment#

end
