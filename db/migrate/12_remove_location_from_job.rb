class RemoveLocationFromJob < ActiveRecord::Migration[6.0]
  def change
    remove_column :jobs, :location
  end
end
