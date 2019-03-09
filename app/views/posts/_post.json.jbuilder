json.extract! post, :id, :user_id, :text, :image1, :image2, :image3, :longitude, :latitude, :book_id, :created_at, :updated_at
json.url post_url(post, format: :json)
