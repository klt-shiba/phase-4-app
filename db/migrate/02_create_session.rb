class CreateSession < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
