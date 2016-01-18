class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.text :description
      t.text :customer_role
      t.text :provider_role
      t.text :customer_consequence
      t.text :provider_consequence
      t.float :amount

      t.timestamps null: false
    end
  end
end
