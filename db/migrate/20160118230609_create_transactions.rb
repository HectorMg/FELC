class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.text :description
      t.text :customer_role
      t.text :provider_role
      t.text :customer_consequence
      t.text :provider_consequence
      t.text :valid_through
      t.float :amount
      t.references :provider, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
    end
  end
end
