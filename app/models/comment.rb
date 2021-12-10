class Comment < ApplicationRecord
  # Direct associations

  belongs_to :commenter,
             :class_name => "Poet"

  belongs_to :poem

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    body
  end

end
