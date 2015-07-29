class User < ActiveRecord::Base
  has_many :lists
  has_many :items, through: :lists  

  has_secure_password
  validates :email, presence: true, uniqueness: true
end
