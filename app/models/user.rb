class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :posts
  has_many :comments
  has_many :votes
  has_secure_password
  validates :username, :presence => true
  validates :username, :uniqueness => true
  validates :password, :confirmation => true
end
