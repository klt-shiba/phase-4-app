class AddPosterIdToJobs < ActiveRecord::Migration[6.0]
    def change
      add_column :jobs, :poster_id, :integer
    end
  end