class ChangeValidThroughForTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :start_date
    remove_column :transactions, :end_date
    add_column :transactions, :valid_through, :text
  end
end
