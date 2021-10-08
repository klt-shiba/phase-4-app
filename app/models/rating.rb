class Rating < ActiveRecord::Base
    belongs_to :bidder
    belongs_to :poster
  
    validates :rating, numericality: { only_integer: true } 
  
  end
  