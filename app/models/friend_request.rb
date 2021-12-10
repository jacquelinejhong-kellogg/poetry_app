class FriendRequest < ApplicationRecord
  # Direct associations

  belongs_to :sender,
             :class_name => "Poet"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    sender.to_s
  end

end
