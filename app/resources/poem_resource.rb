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

  belongs_to :author,
             resource: PoetResource

  has_many   :likes

  has_many   :comments

  # Indirect associations

  many_to_many :supporters,
               resource: PoetResource

end
