class Venue < ApplicationRecord
  # Direct associations

  belongs_to :venue_creator,
             :class_name => "User",
             :foreign_key => "created_by",
             :counter_cache => true

  # Indirect associations

  # Validations

end
