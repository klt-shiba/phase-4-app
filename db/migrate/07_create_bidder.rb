class CreateBidder < ActiveRecord::Migration[6.0]
    def change
      create_table :bidders do |t|
        t.integer :user_id
        t.timestamps null: false
      end
    end
  end
  