class Poem < ApplicationRecord
  # Direct associations

  belongs_to :author,
             :class_name => "Poet"

  has_many   :likes,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  # Indirect associations

  has_many   :supporters,
             :through => :likes,
             :source => :poet

  # Validations

  # Scopes

  def to_s
    title
  end

end
