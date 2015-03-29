class User < ActiveRecord::Base
  validates_presence_of :username
  validates :password, presence: true, on: :create, length: {minimum: 3}
  validates_uniqueness_of :username
  
  has_secure_password validations: false

  
end
