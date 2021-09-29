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



    ## 
    ## Method to only show posts from the same category
    ## Category parameter is passed into method and used to select all Jobs matching that category
    ##
    def self.filter_by_category(category)
        @jobs = Job.all.select { |job| job.category == category}
    end


end