class Job < ActiveRecord::Base
  belongs_to :poster

  has_many :bids
  has_many :bidders, through: :bids

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :day, presence: true
  validates :time, presence: true
  validates :category, presence: true

  scope :is_category, ->(category) { where(category: category) }

  ## Query most recent job posts and trim number
  scope :most_recent, -> { order('created_at desc').limit(10) }

  ## Scope method to find most popular jobs based on number of bids
  ##
  scope :most_popular, -> { left_joins(:bids).group('jobs.id').order('count(bids.job_id) desc').limit(10) }

  def self.search(params)
    ## Search database for titles that are similar to searched value
    where('LOWER(title) LIKE ?', "%#{params}%")
  end

  ## Class method to find most popular jobs based on number of bids
  ##
  # def self.most_popular(array)
  #   results = []
  #   array.select do |bid|
  #     Job.all.select do |job|
  #       results << job if job.id == bid.job_id
  #     end
  #   end
  #   results
  # end
end
