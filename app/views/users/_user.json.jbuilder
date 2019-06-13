json.extract! user, :id, :name, :image, :introduction, :email, :password_digest, :points, :weblink, :thanksImage, :created_at, :updated_at
json.url user_url(user, format: :json)
