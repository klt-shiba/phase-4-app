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

  def self.most_popular(array)
    results = []
    array.select do |bid|
      Job.all.select do |job|
        results << job if job.id == bid.job_id
      end
    end
    results
  end
end
