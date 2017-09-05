class Fight < ApplicationRecord
  # Direct associations

  belongs_to :fighter,
             :counter_cache => true

  # Indirect associations

  # Validations

end
