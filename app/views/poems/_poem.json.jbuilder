json.extract! poem, :id, :title, :body, :author_id, :date, :commentary, :created_at, :updated_at
json.url poem_url(poem, format: :json)
