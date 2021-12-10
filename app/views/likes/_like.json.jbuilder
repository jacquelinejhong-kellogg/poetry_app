json.extract! like, :id, :poem_id, :liker_id, :created_at, :updated_at
json.url like_url(like, format: :json)
