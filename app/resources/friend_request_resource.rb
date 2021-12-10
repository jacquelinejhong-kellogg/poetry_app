class FriendRequestResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :sender_id, :integer
  attribute :recipient_id, :integer

  # Direct associations

  belongs_to :recipient,
             resource: PoetResource

  belongs_to :sender,
             resource: PoetResource

  # Indirect associations
end
