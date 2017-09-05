class Venue < ApplicationRecord
  mount_uploader :pic, PicUploader

  # Direct associations

  has_many   :fights,
             :dependent => :destroy

  belongs_to :venue_creator,
             :class_name => "User",
             :foreign_key => "created_by",
             :counter_cache => true

  # Indirect associations

  # Validations

end
