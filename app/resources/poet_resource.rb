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

  has_many   :received_friend_requests,
             resource: FriendRequestResource,
             foreign_key: :recipient_id

  has_many   :sent_friend_requests,
             resource: FriendRequestResource,
             foreign_key: :sender_id

  has_many   :likes,
             foreign_key: :liker_id

  has_many   :comments,
             foreign_key: :commenter_id

  has_many   :poems,
             foreign_key: :author_id

  # Indirect associations

  many_to_many :liked_poems,
               resource: PoemResource

  has_many :senders, resource: PoetResource do
    assign_each do |poet, poets|
      poets.select do |p|
        p.id.in?(poet.senders.map(&:id))
      end
    end
  end

  has_many :recipients, resource: PoetResource do
    assign_each do |poet, poets|
      poets.select do |p|
        p.id.in?(poet.recipients.map(&:id))
      end
    end
  end


  filter :sender_id, :integer do
    eq do |scope, value|
      scope.eager_load(:senders).where(:friend_requests => {:sender_id => value})
    end
  end

  filter :recipient_id, :integer do
    eq do |scope, value|
      scope.eager_load(:recipients).where(:friend_requests => {:recipient_id => value})
    end
  end
end
