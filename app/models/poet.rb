class Poet < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  has_many   :received_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :likes,
             :foreign_key => "liker_id",
             :dependent => :destroy

  has_many   :comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  has_many   :poems,
             :foreign_key => "author_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :liked_poems,
             :through => :likes,
             :source => :poem

  has_many   :senders,
             :through => :received_friend_requests,
             :source => :sender

  has_many   :recipients,
             :through => :sent_friend_requests,
             :source => :recipient

  # Validations

  # Scopes

  def to_s
    email
  end

end
