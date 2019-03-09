json.extract! book, :id, :user_id, :title, :prologue, :bookcover, :progress, :schedule, :created_at, :updated_at
json.url book_url(book, format: :json)
