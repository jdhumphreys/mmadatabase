class User < ApplicationRecord
  # Direct associations

  has_many   :venues,
             :foreign_key => "created_by"

  has_many   :fighters,
             :foreign_key => "created_by",
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
