class Poem < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end

end
