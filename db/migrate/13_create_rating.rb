class CreateRating < ActiveRecord::Migration[6.0]
    def change
      create_table :ratings do |t|
        t.integer :rating
        t.references :poster
        t.references :bidder
        t.timestamps null: false
      end
    end
  end
  