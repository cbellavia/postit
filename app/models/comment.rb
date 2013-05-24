class Comment < ActiveRecord::Base
  attr_accessible :body, :post_id, :user_id
  belongs_to :user
  belongs_to :post
  has_many :votes, :as => :votable
  
  validates :body, :presence => true
  
   def total_votes
    self.up_votes = self.down_votes
  end
  def up_votes
    self.votes.where(vote: true).size
  end
  
  def down_votes
    self.votes.where(vote: false).size
  end
end
