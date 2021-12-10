class Poet < ApplicationRecord
  # Direct associations

  has_many   :poems,
             :foreign_key => "author_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

end
