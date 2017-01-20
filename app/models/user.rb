class User < ActiveRecord::Base
  has_secure_password
  # Remember to create a migration!
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
