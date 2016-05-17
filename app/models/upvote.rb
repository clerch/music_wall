class Upvote < ActiveRecord::Base

  belongs_to :user
  belongs_to :track

  validates :user, :post, presence: true



end
