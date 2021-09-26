class CreateJob < ActiveRecord::Migration[6.0]
    def change
      create_table :jobs do |t|
        t.string :title
        t.string :category
        t.text :description
        t.integer :price
        t.string :day
        t.string :time
        t.timestamps null: false
      end
    end
  end
  