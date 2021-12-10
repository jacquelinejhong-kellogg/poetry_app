class Like < ApplicationRecord
  # Direct associations

  belongs_to :poet,
             foreign_key: "liker_id"

  belongs_to :poem

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    poem.to_s
  end
end
