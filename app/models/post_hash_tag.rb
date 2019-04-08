class PostHashTag < ApplicationRecord
    has_many :post
    has_many :hashTag
end
