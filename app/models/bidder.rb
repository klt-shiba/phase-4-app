class Bidder < ActiveRecord::Base
  belongs_to :user

  has_many :bids
  has_many :jobs, through: :bids
  has_many :ratings

end
