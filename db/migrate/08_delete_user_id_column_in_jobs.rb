class DeleteUserIdColumnInJobs < ActiveRecord::Migration[6.0]

        def change
          remove_column :jobs, :user_id
      end
    end