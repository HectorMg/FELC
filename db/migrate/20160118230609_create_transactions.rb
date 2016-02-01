class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.text :description
      t.integer :provider_id
      t.integer :customer_id
      t.text :customer_role
      t.text :provider_role
      t.text :customer_consequence
      t.text :provider_consequence
      t.text :valid_through
      t.float :amount
    end
  end
end
