class BookHashTag < ApplicationRecord
  belongs_to :book#

  def self.search(keyword)
    @books = []
    if keyword
        self.where(['tag LIKE ?', "%#{keyword}%"]).each do |hashTag|
            @books << hashTag.book
        end
    else
        self.all.each do |hashTag|
            @books << hashTag.book
        end
    end
    
    return @books
end

end
