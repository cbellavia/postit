class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_categories
  has_many :categories, :through => :post_categories
  has_many :comments
  validates :title, :url, :description, :presence => true
end