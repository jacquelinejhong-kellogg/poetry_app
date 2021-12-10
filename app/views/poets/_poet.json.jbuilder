json.extract! poet, :id, :email, :password, :name, :bio, :dob, :photo,
              :created_at, :updated_at
json.url poet_url(poet, format: :json)
