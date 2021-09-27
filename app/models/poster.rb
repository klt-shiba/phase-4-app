class Poster < ActiveRecord::Base

    belongs_to :user
    has_many :jobs


    def create_poster(id)
        
        if Poster.all.map(&:user_id).include? id
         
    end

end