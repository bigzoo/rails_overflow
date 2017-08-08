class User < ApplicationRecord
  has_many :questions, :answers
  has_secure_password
  validates_uniqueness_of :email, :username
end
