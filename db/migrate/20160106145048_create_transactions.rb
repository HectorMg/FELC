class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.text :description
      t.integer :provider_id
      t.integer :customer_id
      t.float :amount

      t.timestamps null: false
    end
  end
end
