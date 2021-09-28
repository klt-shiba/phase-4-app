class Job < ActiveRecord::Base
    
    belongs_to :poster

    has_many :bids
    has_many :bidders, through: :bids

    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :day, presence: true
    validates :time, presence: true
    validates :category, presence: true



    

end