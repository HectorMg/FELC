class AddReferencesToTransactions < ActiveRecord::Migration
  def change
    add_reference :transactions, :provider, index: true, foreign_key: true
    add_reference :transactions, :customer, index: true, foreign_key: true
  end
end
