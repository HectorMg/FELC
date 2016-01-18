class AddsValidTrhoughToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :valid_through, :text
  end
end
