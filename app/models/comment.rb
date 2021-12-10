class Comment < ApplicationRecord
  # Direct associations

  belongs_to :poem

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    body
  end

end
