class User < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :username, :presence => true

  validates :username, :length => { :minimum => 30 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
