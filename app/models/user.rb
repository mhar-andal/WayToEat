class User < ActiveRecord::Base
  has_secure_password
  has_many :favorites
  has_many :favorite_restaurants, through: :favorites, source: :restaurant
  # Remember to create a migration!
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
