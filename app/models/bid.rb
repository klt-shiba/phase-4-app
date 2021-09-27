class Bid < ActiveRecord::Base

    belongs_to :bidder
    belongs_to :job

    validates :bid_amount, presence: true
end