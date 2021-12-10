class Like < ApplicationRecord
  # Direct associations

  belongs_to :poem

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    poem.to_s
  end

end
