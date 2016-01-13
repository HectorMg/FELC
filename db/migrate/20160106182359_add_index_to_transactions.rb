class AddIndexToTransactions < ActiveRecord::Migration
  def change
    add_index :transactions, [:provider_id, :customer_id]
  end
end
