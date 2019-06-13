class PostHashTag < ApplicationRecord
    belongs_to :post

    def self.search(search)
        @posts = []
        if search
            PostHashTag.where(['tag LIKE ?', "%#{search}%"]).each do |hashTag|
                @posts << hashTag.post
            end
        else
            PostHashTag.all.each do |hashTag|
                @posts << hashTag.post
            end
        end
        return @posts
    end
end
