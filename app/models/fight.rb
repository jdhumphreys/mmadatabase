class Fight < ApplicationRecord
  mount_uploader :poster, PosterUploader

  # Direct associations

  belongs_to :venue

  belongs_to :fighter2,
             :class_name => "Fighter"

  belongs_to :fighter,
             :counter_cache => true

  # Indirect associations

  # Validations

end
