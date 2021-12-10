class PoemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :body, :string
  attribute :author_id, :integer
  attribute :date, :datetime
  attribute :commentary, :string

  # Direct associations

  has_many   :likes

  has_many   :comments

  # Indirect associations

end
