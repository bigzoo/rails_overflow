class User < ApplicationRecord
  has_many :questions
  has_many :answers
  has_secure_password
  validates_uniqueness_of :email, :username
end
