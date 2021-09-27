class CreateBid < ActiveRecord::Migration[6.0]
    def change
      create_table :bids do |t|
        t.integer :bid_amount
        t.text :comment
        t.belongs_to :bidder
        t.belongs_to :job
        t.timestamps null: false
      end
    end
  end
  