class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.integer :quantity
      t.float :price
      t.float :previous_price
      t.float :market_cap

      t.timestamps null: false
    end
  end
end
