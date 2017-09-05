class Fighter < ApplicationRecord
  mount_uploader :pic, PicUploader

  # Direct associations

  has_many   :bsides,
             :class_name => "Fight",
             :foreign_key => "fighter2",
             :dependent => :destroy

  has_many   :fights

  belongs_to :profile_creator,
             :class_name => "User",
             :foreign_key => "created_by",
             :counter_cache => true

  # Indirect associations

  # Validations

end
