class Bid < ActiveRecord::Base

    belongs_to :bidder
    belongs_to :job
    
end