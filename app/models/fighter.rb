class Fighter < ApplicationRecord
  # Direct associations

  has_many   :fights

  belongs_to :profile_creator,
             :class_name => "User",
             :foreign_key => "created_by",
             :counter_cache => true

  # Indirect associations

  # Validations

end
