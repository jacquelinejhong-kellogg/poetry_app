class PoetResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string
  attribute :bio, :string
  attribute :dob, :date
  attribute :photo, :string

  # Direct associations

  # Indirect associations

end
