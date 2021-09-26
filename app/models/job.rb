class Job < ActiveRecord::Base
    belongs_to :user

    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :day, presence: true
    validates :time, presence: true
    validates :category, presence: true

end