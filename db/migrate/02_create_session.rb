class CreateSession < ActiveRecord::Migration
    def change
      create_table :sessions do |t|
        t.string :name

  
        t.timestamps null: false
      end
    end
  end
  