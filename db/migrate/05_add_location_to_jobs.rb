class AddLocationToJobs < ActiveRecord::Migration[6.0]
    def change
      add_column :jobs, :location, :string
    end
  end