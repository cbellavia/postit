class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :post_categories
  has_many :posts, :through => :post_categories
end
